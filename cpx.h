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

#ifndef _cpx_h
#define _cpx_h

#include <gemx.h>
#include "global.h"

#define	PH_MAGIC 0x601a		/* Magic des Programmheaders */

typedef struct
{
	short ph_branch;
	long  ph_tlen;
	long  ph_dlen;
	long  ph_blen;
	long  ph_slen;
	long  ph_res1;
	long  ph_prgflags;
	short ph_absflag;
} PH;

struct foobar
{
	short	dummy;
	short	*image;
};

struct cl_segm
{
	void	*text_seg;
	long	len_text;
	void	*data_seg;
	long	len_data;
	void	*bss_seg;
	long	len_bss;
};

typedef struct
{
	unsigned short   magic;

	struct
	{
		unsigned reserved:	13;
		unsigned ram_resident:	1;
		unsigned boot_init:	1;
		unsigned set_only:	1;
	} flags;

	long	cpx_id;
	unsigned short	cpx_version;
	char	i_text[14];
	unsigned short	icon[48];

	struct
	{
		unsigned i_color:	4;
		unsigned reserved:	4;
		unsigned i_char:	8;
	} i_info;

	char	text[18];

	struct
	{
		unsigned c_board:	4;
		unsigned c_text:	4;
		unsigned pattern:	4;
		unsigned c_back:	4;
	} t_info;

	char	buffer[64];
	char	reserved[306];
} CPXHEAD;

/* Mausparameter */
typedef struct
{
	short	x;
	short	y;
	short	buttons;
	short	kstate;
} MRETS;

/* Struktur zur Verwaltung von CPX-Modulen */
typedef struct cpxlist
{
	char	f_name[14];
	short	head_ok;
	short	segm_ok;
	struct cl_segm	*segm;
	struct cpxlist	*next;
	CPXHEAD	header;
} CPX_LIST;

/* Funktionen und Flags die von XControl zur Verf�gung  */
/* gestellt werden.                                     */
typedef struct
{
	short	handle;
	short	booting;
	short	reserved;
	short	SkipRshFix;
	
	CPX_LIST * _cdecl (*get_cpx_list)(void);
	short _cdecl (*save_header)(CPX_LIST *header);
	
	void  _cdecl (*rsh_fix)(short num_objs,short num_frstr, short num_frimg, short num_tree,
				OBJECT *rs_object, TEDINFO *rs_tedinfo, char *rs_strings[],
				ICONBLK *rs_iconblk, BITBLK *rs_bitblk,
				long *rs_frstr, long *rs_frimg, long *rs_trindex, struct foobar *rs_imdope);
	
	void  _cdecl (*rsh_obfix)(OBJECT *tree, short ob);
	
	short _cdecl (*Popup)(char *items[], short no_items, short slct, short font, GRECT *up, GRECT *world);

	void  _cdecl (*Sl_size)(OBJECT *tree, short base, short slider,
				short entrys, short vis_ent, short hvflag, short min_pix);
	void  _cdecl (*Sl_x)(OBJECT *tree, short base, short slider, short value,
			     short min, short max, void (*foo)(void));
	void  _cdecl (*Sl_y)(OBJECT *tree, short base, short slider, short value,
			     short min, short max, void (*foo)(void));
	void  _cdecl (*Sl_arrow)(OBJECT *tree, short base, short slider, short obj,
				 short inc, short min, short max, short *value, short hvflag, void (*foo)(void));
	void  _cdecl (*Sl_dragx)(OBJECT *tree, short base, short slider,
				 short min, short max, short *value, void (*foo)(void));
	void  _cdecl (*Sl_dragy)(OBJECT *tree, short base, short slider,
				 short min, short max, short *value, void (*foo)(void));
	
	short _cdecl (*Xform_do)(OBJECT *tree, short eobj, short *msg);
	
	GRECT * _cdecl (*GetFirstRect)(GRECT *prect);
	GRECT * _cdecl (*GetNextRect)(void);
	
	void _cdecl (*Set_Evnt_Mask)(short mask, MOBLK *m1, MOBLK *m2, long evtime);
	
	short _cdecl (*XGen_Alert)(short al);
	short _cdecl (*CPX_Save)(void *ptr, long bytes);
	void *_cdecl (*Get_Buffer)(void);
	short _cdecl (*getcookie)(long cookie, long *p_value);
	short Country_Code;
	void _cdecl (*MFsave)(short flag, MFORM *mf);

} XCPB;

/* Funktionen die vom CPX-Modul zur Verf�gung   */
/* gestellt werden.                             */
typedef struct
{
	short _cdecl (*cpx_call)(GRECT *rect);
	void  _cdecl (*cpx_draw)(GRECT *clip);
	void  _cdecl (*cpx_wmove)(GRECT *work);
	void  _cdecl (*cpx_timer)(short *quit);
	void  _cdecl (*cpx_key)(short kstate, short key, short *quit);
	void  _cdecl (*cpx_button)(MRETS *mrets, short nclicks, short *quit);
	void  _cdecl (*cpx_m1)(MRETS *mrets, short *quit);
	void  _cdecl (*cpx_m2)(MRETS *mrets, short *quit);
	short _cdecl (*cpx_hook)(short event, short *msg, MRETS *mrets, short *key, short *nclicks);
	void  _cdecl (*cpx_close)(short flag);
} CPXINFO;

/* N�tzliche Definitionen */
#define XAL_SAVE_DEFAULTS	0
#define XAL_MEM_ERR		1
#define XAL_FILE_ERR		2
#define XAL_FILE_NOT_FOUND	3

#define MFSAVE      1
#define MFRESTORE   0

#ifndef	CT_KEY
#define CT_KEY  53
#endif

#define	CPXD_INVALID	0x8000	/* signalisiert ung�ltigen CPX_DESC-Eintrag */
#define	CPXD_AUTOSTART	0x0002
#define	CPXD_INACTIVE	0x0001

typedef	struct cpx_desc
{
	struct cpx_desc *next;	/* Zeiger auf die n�chste CPX-Beschreibung oder 0L */

	void	*start_of_cpx;	/* Startadresse des CPX im Speicher */
	void	*end_of_cpx;	/* Endadresse des CPX im Speicher */
	void	*sp_memory;	/* Start des Stackspeichers f�r den CPX-Kontext w�hrend cpx_call() */
	
	void	*context[16];	/* gesicherter Registerkontext */
	void	*return_addr;	/* tempor�re R�cksprungadresse */

	CPXINFO	*info;		/* Zeiger auf CPXINFO-Struktur die bei cpx_call() zur�ckgeliefert wird */

	DIALOG	*dialog;	/* Zeiger auf die Dialogbeschreibung oder 0L, wenn das CPX nicht offen ist */
	OBJECT	*tree;		/* ist bei Form-CPX 0L, bis cpx_form_do() aufgerufen wird */
	short	whdl;		/* Handle des Dialogfensters */
	short	window_x;	/* Position des Dialogfensters */
	short	window_y;

	short	is_evnt_cpx;	/* 0: Form-CPX 1: Event-CPX */
	short	button;		/* wird von handle_form_cpx() zur�ckgeliefert */
	short	*msg;		/* Zeiger auf den bei Xform_do() �bergebenen Messagebuffer */

	short	obfix_cnt;
	short	box_width;
	short	box_height;
	GRECT	size;		/* Dialogausma�e und -position */
	OBJECT	empty_tree[2];	/* IBOX f�r leeren Objektbaum am Anfang,
				   wegen WDIALOG-Fehler aus 2 Objekten bestehend */

	struct cl_segm segm;
	
	short	icon_x;		/* Iconposition innerhalb des Hauptfensters */
	short	icon_y;

	int	selected;
	short	flags;

	/* Daten auf die das CPX Zugriff hat bzw. �ber Funktionen �dern kann */

	GRECT	redraw_area;	/* Bereich den ein CPX nach WM_REDRAW neuzeichnen soll */
	GRECT	dirty_area;	/* Bereich eines neuzuzeichnenden Rechtecks */
	short	mask;		/* zus�tzliche Ereignismaske f�r evnt_multi() */
	MOBLK	m1;		/* Mausrechteck f�r evnt_multi() */
	MOBLK	m2;		/* Mausrechteck f�r evnt_multi() */
	long	time;		/* Timerintervall f�r evnt_multi() */

	CPX_LIST old;		/* Beschreibung f�r get_cpx_list */
	XCPB	xctrl_pb;	/* Parameterblock f�r das CPX */
	
	char	file_name[0];
} CPX_DESC;

#endif /* _cpx_h */