/*
 * COPS (c) 1995 - 2003 Sven & Wilfried Behne
 *                 2004 F.Naumann & O.Skancke
 *
 * A XCONTROL compatible CPX manager.
 *
 * This file is part of COPS.
 *
 * COPS is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * COPS is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with XaAES; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

#include <stdlib.h>
#include <stdio.h>

#include "cops_rsc.h"
#include "callback.h"
#include "cpx_bind.h"
#include "cops.h"

#define CPX_STACKSIZE 16384

#if defined(__GNUC__)
static __inline long get_sp(void)
{
	register long sp __asm__("d0");
	__asm__ volatile("\tmove.l %%a7,%0\n" : "=d"(sp) : : "cc");
	return sp;
}
static __inline __attribute__((noreturn)) void jumpto(void (*_f)(void), long sp)
{
	register void (*f)(void) __asm__("a0") = _f;
	__asm__ volatile(
		"\tmove.l %1,%%a7\n"
		"\tjmp (%0)\n"
	:
	: "a"(f), "r"(sp)
	/* does not return, so no need to declare any clobbered regs */
	);
	__builtin_unreachable();
}
#endif

#if defined(__PUREC__)
static long get_sp(void) 0x200f; /* move.l a7,d0 */
static void *jumpto_0(void (*f)(void), long) 0x2e40; /* move.l d0,a7 */
static void jumpto_1(void *) 0x4ed0; /* jmp (a0) */
#define jumpto(f, sp) jumpto_1(jumpto_0(f, sp))
#endif

#if defined(__AHCC__)
static long __asm__ get_sp(void)
{
	move.l a7,d0
	addq.l #4,d0
}
static void __asm__ jumpto(void (*f)(void), long sp)
{
	move.l d0,a7
	jmp (a0)
}
#endif



#define DEBUG_CALLBACK(cpx) DEBUG((DEBUG_FMT "(%s)\n", DEBUG_ARGS, cpx->file_name))


#if defined(__GNUC__)
static inline void *cpx_void(void *_f)
{
	register void *retvalue __asm__("d0");
	register void *f __asm__("a0") = _f;
	__asm__ __volatile__(
			"\tjsr (%1)\n"
		: "=d"(retvalue)
		: "a"(f)
		: "d2", "a2", "cc" AND_MEMORY
		);
	return retvalue;
}
static inline void *cpx_pll(void *_f, void *_p, long _l1, long _l2)
{
	register void *retvalue __asm__("d0");
	register void *f __asm__("a0") = _f;
	register void *p __asm__("a1") = _p;
	register long l1 __asm__("d0") = _l1;
	register long l2 __asm__("d1") = _l2;
	__asm__ __volatile__(
			"\tmove.l %4,-(%%sp)\n"
			"\tmove.l %3,-(%%sp)\n"
			"\tmove.l %2,-(%%sp)\n"
			"\tjsr (%1)\n"
			"\tlea 12(%%sp),%%sp\n"
		: "=d"(retvalue)
		: "a"(f), "a"(p), "d"(l1), "d"(l2)
		: "d2", "a2", "cc" AND_MEMORY
		);
	return retvalue;
}
static inline long cpx_pp(void *_f, void *_p1, void *_p2)
{
	register long retvalue __asm__("d0");
	register void *f __asm__("a0") = _f;
	register void *p1 __asm__("a1") = _p1;
	register void *p2 __asm__("d0") = _p2;
	__asm__ __volatile__(
			"\tmove.l %3,-(%%sp)\n"
			"\tmove.l %2,-(%%sp)\n"
			"\tjsr (%1)\n"
			"\taddq.l #8,%%sp\n"
		: "=d"(retvalue)
		: "a"(f), "a"(p1), "d"(p2)
		: "d2", "a2", "cc" AND_MEMORY
		);
	return retvalue;
}
static inline void cpx_psp(void *_f, void *_p1, short _s, void *_p2)
{
	register void *f __asm__("a0") = _f;
	register void *p1 __asm__("a1") = _p1;
	register short s __asm__("d0") = _s;
	register void *p2 __asm__("d1") = _p2;
	__asm__ __volatile__(
			"\tmove.l %3,-(%%sp)\n"
			"\tmove.w %2,-(%%sp)\n"
			"\tmove.l %1,-(%%sp)\n"
			"\tjsr (%0)\n"
			"\tlea 10(%%sp),%%sp\n"
		:
		: "a"(f), "a"(p1), "d"(s), "d"(p2)
		: "d2", "a2", "cc" AND_MEMORY
		);
}
static inline void cpx_ssp(void *f, unsigned short s1, unsigned short s2, void *p)
{
	cpx_pp(f, (void *)(((unsigned long)s1 << 16) | s2), p);
}
static inline long cpx_p(void *_f, void *_p1)
{
	register long retvalue __asm__("d0");
	register void *f __asm__("a0") = _f;
	register void *p1 __asm__("a1") = _p1;
	__asm__ __volatile__(
			"\tmove.l %2,-(%%sp)\n"
			"\tjsr (%1)\n"
			"\taddq.l #4,%%sp\n"
		: "=d"(retvalue)
		: "a"(f), "a"(p1)
		: "d2", "a2", "cc" AND_MEMORY
		);
	return retvalue;
}
static inline long cpx_spppp(void *_f, short _s, void *_p1, void *_p2, void *_p3, void *_p4)
{
	register long retvalue __asm__("d0");
	register void *f __asm__("a0") = _f;
	register short s __asm__("d0") = _s;
	register void *p1 __asm__("a1") = _p1;
	register void *p2 __asm__("d1") = _p2;
	register void *p3 __asm__("d2") = _p3;
	register void *p4 __asm__("a2") = _p4;
	__asm__ __volatile__(
			"\tmove.l %6,-(%%sp)\n"
			"\tmove.l %5,-(%%sp)\n"
			"\tmove.l %4,-(%%sp)\n"
			"\tmove.l %3,-(%%sp)\n"
			"\tmove.w %2,-(%%sp)\n"
			"\tjsr (%1)\n"
			"\tlea 18(%%sp),%%sp\n"
		: "=d"(retvalue)
		: "a"(f), "d"(s), "a"(p1), "d"(p2), "d"(p3), "a"(p4)
		: "cc" AND_MEMORY
		);
	return retvalue;
}
static inline void cpx_s(void *_f, short _s)
{
	register void *f __asm__("a0") = _f;
	register short s __asm__("d0") = _s;
	__asm__ __volatile__(
			"\tmove.w %1,-(%%sp)\n"
			"\tjsr (%0)\n"
			"\taddq.l #2,%%sp\n"
		:
		: "a"(f), "d"(s)
		: "d2", "a2", "cc" AND_MEMORY
		);
}
#elif defined (__PUREC__) || defined(__AHCC__)
#define cpx_void(f) (*f)()
#define cpx_pll(f, p, l1, l2) (*f)(p, l1, l2)
#define cpx_pp(f, p1, p2) (*f)(p1, p2)
#define cpx_ssp(f, s1, s2, p) (*f)(s1, s2, p)
#define cpx_p(f, p1) (*f)(p1)
#define cpx_psp(f, p1, s, p2) (*f)(p1, s, p2)
#define cpx_spppp(f, s, p1, p2, p3, p4) (*f)(s, p1, p2, p3, p4)
#define cpx_s(f, s) (*f)(s)
#else
you loose
#endif



void
cpx_userdef(void __CDECL (*userdef)(void))
{
	DEBUG(("cpx_userdef(%p)\n", userdef));

	if (userdef)
	{
		cpx_void(userdef);
	}
}


CPXINFO	*
cpx_init(CPX_DESC *cpx_desc, struct xcpb *xcpb)
{
	CPXINFO *_cdecl (*init)(struct xcpb *, long, long);
	CPXINFO *ret;

	DEBUG_CALLBACK(cpx_desc);

	init = cpx_desc->start_of_cpx;

	/*
	 * COPS extensions:
	 * - first magic value 'COPS' (0x434F5053)
	 * - then hex value 0x10001 (whatever it means, taken from
	 *   original assembler bindings)
	 */
	ret = cpx_pll(init, xcpb, 0x434F5053L, 0x10001L);

	DEBUG(("cpx_init -> %p\n", ret));
	return ret;
}

short
cpx_call(CPX_DESC *cpx_desc, GRECT *work)
{
	short ret;

	DEBUG_CALLBACK(cpx_desc);
	DEBUG(("calling out cpx_call at %p\n", cpx_desc->info->cpx_call));

	if (cpx_desc->info->cpx_call == 0)
		return 0;
	ret = cpx_pp(cpx_desc->info->cpx_call, work, cpx_desc->dialog);

	DEBUG(("cpx_call -> %d\n", ret));
	return ret;
}

void
cpx_draw(CPX_DESC *cpx_desc, GRECT *clip)
{
	DEBUG_CALLBACK(cpx_desc);

	if (cpx_desc->info->cpx_draw)
		cpx_p(cpx_desc->info->cpx_draw, clip);
}

void
cpx_wmove(CPX_DESC *cpx_desc, GRECT *work)
{
	DEBUG_CALLBACK(cpx_desc);

	if (cpx_desc->info->cpx_wmove)
		cpx_p(cpx_desc->info->cpx_wmove, work);
}

short
cpx_timer(CPX_DESC *cpx_desc)
{
	short ret = 0;

	DEBUG_CALLBACK(cpx_desc);

	if (cpx_desc->info->cpx_timer)
		cpx_p(cpx_desc->info->cpx_timer, &ret);

	return ret;	
}

short
cpx_key(CPX_DESC *cpx_desc, short kstate, short key)
{
	short ret = 0;

	DEBUG_CALLBACK(cpx_desc);

	if (cpx_desc->info->cpx_key)
	{
		cpx_ssp(cpx_desc->info->cpx_key, kstate, key, &ret);
	}

	return ret;
}

short
cpx_button(CPX_DESC *cpx_desc, MRETS *mrets, short nclicks)
{
	short ret = 0;

	DEBUG_CALLBACK(cpx_desc);

	if (cpx_desc->info->cpx_button)
	{
		cpx_psp(cpx_desc->info->cpx_button, mrets, nclicks, &ret);
	}

	return ret;
}

short
cpx_m1(CPX_DESC *cpx_desc, MRETS *mrets)
{
	short ret = 0;

	DEBUG_CALLBACK(cpx_desc);

	if (cpx_desc->info->cpx_m1)
		cpx_pp(cpx_desc->info->cpx_m1, mrets, &ret);

	return ret;
}

short
cpx_m2(CPX_DESC *cpx_desc, MRETS *mrets)
{
	short ret = 0;

	DEBUG_CALLBACK(cpx_desc);

	if (cpx_desc->info->cpx_m2)
		cpx_pp(cpx_desc->info->cpx_m2, mrets, &ret);

	return ret;
}

short
cpx_hook(CPX_DESC *cpx_desc, _WORD event, _WORD *msg, MRETS *mrets, _WORD *key, _WORD *nclicks)
{
	short ret = 0;

	DEBUG_CALLBACK(cpx_desc);

	if (cpx_desc->info->cpx_hook)
	{
		ret = cpx_spppp(cpx_desc->info->cpx_hook, event, msg, mrets, key, nclicks);
	}

	return ret;
}

void
cpx_close(CPX_DESC *cpx_desc, _WORD flag)
{
	DEBUG_CALLBACK(cpx_desc);

	if (cpx_desc->info->cpx_close)
	{
		cpx_s(cpx_desc->info->cpx_close, flag);
	}
}


#if 0
_a_call_main:
	movem.l	d0-d7/a0-a7,alpha_context	| Kontext des Hauptprogramms
	move.l	#a_call_return,-(sp)		| Rueckkehrfunktion ins Hauptprogramm
	move.l	sp,kernel_stack
	bsr	_cpx_main_loop			| Eventschleife

a_call_return:
	movem.l	alpha_context(pc),d0-d7/a0-a7
	rts
#endif

static jmp_buf alpha_context;
static long kernel_stack;

void
a_call_main(void)
{
	DEBUG(("a_call_main: enter\n"));

	/* remember current stack */
	kernel_stack = get_sp();
	DEBUG(("a_call_main: kernel_stack 0x%lx\n", kernel_stack));

	if (setjmp(alpha_context))
	{
		DEBUG(("a_call_main: leave\n"));
		return;
	}

	jumpto(cpx_main_loop, kernel_stack);

	/* never reached */
	__builtin_unreachable();
}
void
a_call_return(void)
{
	DEBUG(("a_call_return\n"));
	longjmp(alpha_context, 1);

	/* never reached */
	__builtin_unreachable();
}

#if 0
|short cdecl Xform_do(OBJECT *tree, short edit_obj, short *msg)
|form_do() fuer ein CPX ausfuehren
|Eingaben:
|4(sp).l OBJECT	*tree
|8(sp).w short edit_obj
|10(sp).l short *msg
|
_Xform_do:
	movea.l	(sp),a0				| Ruecksprungadresse
	bsr	_get_cpx_desc			| CPX_DESC suchen
	move.l	a0,d0
	beq.s	Xform_do_err			| kein passendes CPX gefunden

	movem.l	d0-d7/a1-a7,CPXD_context(a0)

	movea.l	4(sp),a1			| tree
	move.w	8(sp),d0			| edit_obj
	move.l	10(sp),d1			| msg

	movea.l	kernel_stack(pc),sp
	move.l	d1,-(sp)			| msg
	bsr	_cpx_form_do			| CPX_DESC *cpx_form_do(CPX_DESC *cpx_desc,
						|		        OBJECT *tree, short edit_obj, short *msg)
	addq.l	#4,sp				| Stack korrigieren
	move.l	a0,d0
	beq	a_call_return			| Hauptfenster wurde geschlossen
	bra	_switch_context			| dieser Fall darf nicht auftreten!

Xform_do_err:
	move.l	10(sp),a0			| msg
	move.w	#41,(a0)			| 41 - AC_CLOSE; close CPX
	moveq	#-1,d0
	rts
#endif

static CPX_DESC *call_cpx_form_do_cpx = NULL;
static struct Xform_do_args call_cpx_form_do_args;

static void
call_cpx_form_do(void)
{
	DEBUG(("call_cpx_form_do\n"));

	cpx_form_do(call_cpx_form_do_cpx,
		    call_cpx_form_do_args.tree,
		    call_cpx_form_do_args.edit_obj,
		    call_cpx_form_do_args.msg);

	/* never reached */
	__builtin_unreachable();
}
short _cdecl
Xform_do(struct Xform_do_args args)
{
	CPX_DESC *cpx;
	void *pc = ((void **)&args)[-1];

	cpx = find_cpx_by_addr(pc);
	DEBUG_CALLBACK(cpx);

	if (cpx)
	{
		/*
		 * save arguments
		 */
		call_cpx_form_do_cpx = cpx;
		call_cpx_form_do_args = args;

		/* save for later return */
		if (setjmp(cpx->jb))
		{
			DEBUG(("Xform_do: return %i\n", cpx->button));
			return cpx->button;
		}

		/*
		 * switch stack and call out form_do
		 */

		jumpto(call_cpx_form_do, kernel_stack);

		/* never reached */
		__builtin_unreachable();
	}

	args.msg[0] = AC_CLOSE;
	return -1;
}

#if 0
|void new_context(CPX_DESC *cpx_desc)|
|Neuen Kontext anlegen, CPX oeffnen, cpx_init() und cpx_call() aufrufen
|Eingaben:
|a0.l CPX_DESC *cpx_desc
|Ausgaben:
|-
_new_context:
	movem.l	d0-d1/a0-a1,-(sp)
	move.l	#16384,d0
	bsr	_malloc				| 16384 Bytes fuer temporaeren Stack anfordern
	move.l	a0,d2
	movem.l	(sp)+,d0-d1/a0-a1

	move.l	d2,CPXD_sp_memory(a0)		| Speicherbereich fuer Stack merken
	beq.s	new_context_err

	add.l	#16384,d2
	move.l	d2,sp				| neuer Stack fuer Eventloop

	movem.l	d0-d7/a0-a7,-(sp)		| CPX oeffnen, ggf. Eventloop aufrufen
	bsr	_open_cpx_context		| void open_cpx_context(CPX_DESC *cpx_desc)
	movem.l	(sp)+,d0-d7/a0-a7

	movea.l	kernel_stack(pc),sp

	movea.l	CPXD_sp_memory(a0),a0		| Speicherbereich fuer den Stack freigeben
	bsr	_free				| Stack freigeben

	bra	_cpx_main_loop			| Hauptschleife aufrufen

new_context_err:
	moveq	#0,d0
	rts
#endif
static CPX_DESC *call_open_cpx_context_desc = NULL;

static void
call_open_cpx_context(void)
{
	DEBUG(("call_open_cpx_context(%s)\n", call_open_cpx_context_desc->file_name));
	open_cpx_context(call_open_cpx_context_desc);

	free(call_open_cpx_context_desc->stack);
	call_open_cpx_context_desc->stack = NULL;

	DEBUG(("call_open_cpx_context(%s) -> go back\n", call_open_cpx_context_desc->file_name));

	jumpto(cpx_main_loop, kernel_stack);
}
short
new_context(CPX_DESC *cpx_desc)
{
	DEBUG(("new_context(%s)\n", cpx_desc->file_name));

	cpx_desc->stack = malloc(CPX_STACKSIZE);
	if (cpx_desc->stack)
	{
		DEBUG(("new_context: stack %p\n", cpx_desc->stack));
		DEBUG(("new_context -> call_open_cpx_context\n"));

		call_open_cpx_context_desc = cpx_desc;

		jumpto(call_open_cpx_context, (long)cpx_desc->stack + CPX_STACKSIZE - 4);

		/* never reached */
		__builtin_unreachable();
	}

	return 0;
}

#if 0
|void switch_context(CPX_DESC *cpx_desc)
|Kontext wechseln, CPX anspringen
|Eingaben:
|a0.l CPX_DESC *cpx_desc
|
_switch_context:
	movem.l	CPXD_context(a0),d0-d7/a1-a7
	move.w	CPXD_button(a0),d0		| Objektnummer oder Message
	rts
#endif
void
switch_context(CPX_DESC *cpx_desc)
{
	DEBUG(("switch_context(%s)\n", cpx_desc->file_name));

	/* return to interrupted Xform_do */
	longjmp(cpx_desc->jb, 1);
}
