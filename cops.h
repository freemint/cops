/*
 * $Id$
 * 
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

#ifndef _cops_h
#define _cops_h

#include "global.h"
#include "cpx.h"

#define ALPHAFILEVERSION 8

extern short app_id;
extern short aes_handle;
extern short pwchar;
extern short phchar;
extern short pwbox;
extern short phbox;

extern short menu_id;
extern short quit;
extern short aes_flags;
extern short aes_font;
extern short aes_height;

extern short vdi_handle;
extern GRECT desk;

typedef struct
{
	long	magic;
	short	version;
	GRECT	mw;
	short	whslide;
	short	wvslide;
	short	booticon;		/* Hauptfenster beim Start �ffnen und ikonifizieren */
	short	clickact;		/* inaktive CPXe werden durch Doppelklick umbenannt und ge�ffnet */
	short	term;
	short	after;
	short	count;
	char	cpx_path[128];
	short	sortmode;		/* 0: unsortiert, 1: nach Namen ordnen */
	short	reserved[15];
} ALPHAHEADER;

extern ALPHAHEADER settings;

extern CPX_LIST *cpxlist;
extern CPX_DESC *cpx_desc_list;

void open_cpx_context(CPX_DESC *cpx_desc);
CPX_DESC *cpx_main_loop(void);

/* gemlib rarely use grect in syscalls */

#define objc_draw_grect(tree,start,depth,r) objc_draw((tree),(start),(depth),(r)->g_x,(r)->g_y,(r)->g_w,(r)->g_h)

#define form_center_grect(t,r) form_center((t),&(r)->g_x,&(r)->g_y,&(r)->g_w,&(r)->g_h)

#define form_xdial_grect(a1,s,f,a2) \
	form_xdial((a1),(s)->g_x,(s)->g_y,(s)->g_w,(s)->g_h,(f)->g_x,(f)->g_y,(f)->g_w,(f)->g_h,(a2))

#define graf_growbox_grect(s,f) \
	graf_growbox((s)->g_x,(s)->g_y,(s)->g_w,(s)->g_h,\
			(f)->g_x,(f)->g_y,(f)->g_w,(f)->g_h)
#define graf_shrinkbox_grect(f,s) \
	graf_shrinkbox((f)->g_x,(f)->g_y,(f)->g_w,(f)->g_h,\
			(s)->g_x,(s)->g_y,(s)->g_w,(s)->g_h)

#endif /* _cops_h */