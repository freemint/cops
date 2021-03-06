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

/*
 * XCPB-Funktionen
 */

#ifndef _callback_h
#define _callback_h

#include "global.h"
#include "cpx.h"

extern struct xcpb xctrl_pb;

typedef enum
{
	NODIR = -1,
	FORWARD,
	BACKWARD,
	DEFAULTDIR
} DIRS;


/* lookup cpx descriptor with addr */
CPX_DESC *find_cpx_by_addr(void *pc);

short _cdecl save_header(struct cpxlist *header);
void cpx_form_do(CPX_DESC *cpx_desc, OBJECT *tree, _WORD edit_obj, _WORD *msg);
_WORD find_obj(OBJECT *tree, _WORD startob, DIRS direction);

#endif /* _callback_h */
