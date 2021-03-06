/*
 * GEM resource C output of cops_rs
 *
 * created by ORCS 2.17
 */

#if !defined(__GNUC__) || !defined(__mc68000__)
#include <portab.h>
#endif

#ifdef OS_WINDOWS
#  include <portaes.h>
#  define SHORT _WORD
#  ifdef __WIN32__
#    define _WORD signed short
#  else
#    define _WORD signed int
 #   pragma option -zE_FARDATA
#  endif
#else
#  ifdef __TURBOC__
#    include <aes.h>
#    define CP (_WORD *)
#  endif
#endif

#ifdef OS_UNIX
#  include <portaes.h>
#  define SHORT _WORD
#else
#  ifdef __GNUC__
#    ifndef __PORTAES_H__
#      if __GNUC__ < 4
#        include <aesbind.h>
#        ifndef _WORD
#          define _WORD int
#        endif
#        define CP (char *)
#      else
#        include <mt_gem.h>
#        ifndef _WORD
#          define _WORD short
#        endif
#        define CP (short *)
#      endif
#      define CW (short *)
#    endif
#  endif
#endif


#ifdef __SOZOBONX__
#  include <xgemfast.h>
#else
#  ifdef SOZOBON
#    include <aes.h>
#  endif
#endif

#ifdef MEGAMAX
#  include <gembind.h>
#  include <gemdefs.h>
#  include <obdefs.h>
#  define _WORD int
#  define SHORT int
#endif

#ifndef _VOID
#  define _VOID void
#endif

#ifndef OS_NORMAL
#  define OS_NORMAL 0x0000
#endif
#ifndef OS_SELECTED
#  define OS_SELECTED 0x0001
#endif
#ifndef OS_CROSSED
#  define OS_CROSSED 0x0002
#endif
#ifndef OS_CHECKED
#  define OS_CHECKED 0x0004
#endif
#ifndef OS_DISABLED
#  define OS_DISABLED 0x0008
#endif
#ifndef OS_OUTLINED
#  define OS_OUTLINED 0x0010
#endif
#ifndef OS_SHADOWED
#  define OS_SHADOWED 0x0020
#endif
#ifndef OS_WHITEBAK
#  define OS_WHITEBAK 0x0040
#endif
#ifndef OS_DRAW3D
#  define OS_DRAW3D 0x0080
#endif

#ifndef OF_NONE
#  define OF_NONE 0x0000
#endif
#ifndef OF_SELECTABLE
#  define OF_SELECTABLE 0x0001
#endif
#ifndef OF_DEFAULT
#  define OF_DEFAULT 0x0002
#endif
#ifndef OF_EXIT
#  define OF_EXIT 0x0004
#endif
#ifndef OF_EDITABLE
#  define OF_EDITABLE 0x0008
#endif
#ifndef OF_RBUTTON
#  define OF_RBUTTON 0x0010
#endif
#ifndef OF_LASTOB
#  define OF_LASTOB 0x0020
#endif
#ifndef OF_TOUCHEXIT
#  define OF_TOUCHEXIT 0x0040
#endif
#ifndef OF_HIDETREE
#  define OF_HIDETREE 0x0080
#endif
#ifndef OF_INDIRECT
#  define OF_INDIRECT 0x0100
#endif
#ifndef OF_FL3DIND
#  define OF_FL3DIND 0x0200
#endif
#ifndef OF_FL3DBAK
#  define OF_FL3DBAK 0x0400
#endif
#ifndef OF_FL3DACT
#  define OF_FL3DACT 0x0600
#endif
#ifndef OF_MOVEABLE
#  define OF_MOVEABLE 0x0800
#endif
#ifndef OF_POPUP
#  define OF_POPUP 0x1000
#endif

#ifndef R_CICONBLK
#  define R_CICONBLK 17
#endif
#ifndef R_CICON
#  define R_CICON 18
#endif

#ifndef G_SWBUTTON
#  define G_SWBUTTON 34
#endif
#ifndef G_POPUP
#  define G_POPUP 35
#endif
#ifndef G_EDIT
#  define G_EDIT 37
#endif
#ifndef G_SHORTCUT
#  define G_SHORTCUT 38
#endif
#ifndef G_SLIST
#  define G_SLIST 39
#endif
#ifndef G_EXTBOX
#  define G_EXTBOX 40
#endif
#ifndef G_OBLINK
#  define G_OBLINK 41
#endif

#ifndef _WORD
#  ifdef WORD
#    define _WORD WORD
#  else
#    define _WORD short
#  endif
#endif

#ifndef _UBYTE
#  define _UBYTE char
#endif

#ifndef _BOOL
#  define _BOOL int
#endif

#ifndef _LONG
#  ifdef LONG
#    define _LONG LONG
#  else
#    define _LONG long
#  endif
#endif

#ifndef _ULONG
#  ifdef ULONG
#    define _ULONG ULONG
#  else
#    define _ULONG unsigned long
#  endif
#endif

#ifndef _LONG_PTR
#  define _LONG_PTR _LONG
#endif

#ifndef C_UNION
#ifdef __PORTAES_H__
#  define C_UNION(x) { (_LONG_PTR)(x) }
#endif
#ifdef __GEMLIB__
#  define C_UNION(x) { (_LONG_PTR)(x) }
#endif
#ifdef __PUREC__
#  define C_UNION(x) { (_LONG_PTR)(x) }
#endif
#ifdef __ALCYON__
#  define C_UNION(x) x
#endif
#endif
#ifndef C_UNION
#  define C_UNION(x) (_LONG_PTR)(x)
#endif

#ifndef SHORT
#  define SHORT short
#endif

#ifndef CP
#  define CP (SHORT *)
#endif

#ifndef CW
#  define CW (_WORD *)
#endif


#undef RSC_STATIC_FILE
#define RSC_STATIC_FILE 1

#include "cops_rs.h"

#ifndef RSC_NAMED_FUNCTIONS
#  define RSC_NAMED_FUNCTIONS 0
#endif

#ifndef __ALCYON__
#undef defRSHInit
#undef defRSHInitBit
#undef defRSHInitStr
#ifndef RsArraySize
#define RsArraySize(array) (_WORD)(sizeof(array)/sizeof(array[0]))
#define RsPtrArraySize(type, array) (type *)array, RsArraySize(array)
#endif
#define defRSHInit( aa, bb ) RSHInit( aa, bb, RsPtrArraySize(OBJECT *, rs_trindex), RsArraySize(rs_object) )
#define defRSHInitBit( aa, bb ) RSHInitBit( aa, bb, RsPtrArraySize(BITBLK *, rs_frimg) )
#define defRSHInitStr( aa, bb ) RSHInitStr( aa, bb, RsPtrArraySize(_UBYTE *, rs_frstr) )
#endif

#ifdef __STDC__
#ifndef W_Cicon_Setpalette
extern _BOOL W_Cicon_Setpalette(_WORD *_palette);
#endif
#ifndef hrelease_objs
extern void hrelease_objs(OBJECT *_ob, _WORD _num_objs);
#endif
#ifndef hfix_objs
extern void *hfix_objs(RSHDR *_hdr, OBJECT *_ob, _WORD _num_objs);
#endif
#endif

#ifndef RLOCAL
#  if RSC_STATIC_FILE
#    ifdef LOCAL
#      define RLOCAL LOCAL
#    else
#      define RLOCAL static
#    endif
#  else
#    define RLOCAL
#  endif
#endif


#ifndef N_
#  define N_(x)
#endif


#if RSC_STATIC_FILE
#undef NUM_STRINGS
#undef NUM_BB
#undef NUM_IB
#undef NUM_CIB
#undef NUM_CIC
#undef NUM_TI
#undef NUM_FRSTR
#undef NUM_FRIMG
#undef NUM_OBS
#undef NUM_TREE
#undef NUM_UD
#define NUM_STRINGS 327
#define NUM_BB		2
#define NUM_IB		0
#define NUM_CIB     1
#define NUM_CIC     1
#define NUM_TI		5
#define NUM_FRSTR	287
#define NUM_FRIMG	0
#define NUM_OBS     40
#define NUM_TREE	6
#define NUM_UD		0
#endif


static char cops_rs_string_0[] = " ";
static char cops_rs_string_1[] = "Control Panel Server \372 Version 1.09";
static char cops_rs_string_2[] = "";
static char cops_rs_string_3[] = "";
static char cops_rs_string_4[] = "OK";
static char cops_rs_string_5[] = "by";
static char cops_rs_string_6[] = "";
static char cops_rs_string_7[] = "";
static char cops_rs_string_8[] = "Thomas Much, Sven & Wilfried Behne";
static char cops_rs_string_9[] = "";
static char cops_rs_string_10[] = "";
static char cops_rs_string_11[] = "";
static char cops_rs_string_12[] = "01234567890123456789";
static char cops_rs_string_13[] = "File name  :";
static char cops_rs_string_14[] = "01234567890123456789";
static char cops_rs_string_15[] = "  Version  :";
static char cops_rs_string_16[] = "01234";
static char cops_rs_string_17[] = "       ID  :";
static char cops_rs_string_18[] = "0123";
static char cops_rs_string_19[] = " Configuration ";
static char cops_rs_string_20[] = "RAM resident";
static char cops_rs_string_21[] = "Set Only";
static char cops_rs_string_22[] = "Boot Init";
static char cops_rs_string_23[] = "Auto Boot";
static char cops_rs_string_24[] = "OK";
static char cops_rs_string_25[] = "Cancel";
static char cops_rs_string_26[] = "Settings";
static char cops_rs_string_27[] = "CPX Path:";
static char cops_rs_string_28[] = "01234567890123456789";
static char cops_rs_string_29[] = "____________________";
static char cops_rs_string_30[] = "X";
static char cops_rs_string_31[] = "Iconify at start";
static char cops_rs_string_32[] = "Double click activates CPZ";
static char cops_rs_string_33[] = "Sort Icons by Name";
static char cops_rs_string_34[] = "Terminate after";
static char cops_rs_string_35[] = "01";
static char cops_rs_string_36[] = "__ minute(s)";
static char cops_rs_string_37[] = "9";
static char cops_rs_string_38[] = "OK";
static char cops_rs_string_39[] = "Cancel";
static char cops_rs_string_40[] = " COPS ";
static char cops_rs_string_41[] = " Control Panels ";
static char cops_rs_string_42[] = "  Control Panels";
static char cops_rs_string_43[] = "Select CPX Path";
static char cops_rs_string_44[] = "AES is inactive.";
static char cops_rs_string_45[] = "[1][No more windows.][Cancel]";
static char cops_rs_string_46[] = "[2][Save Defaults?][Yes|No]";
static char cops_rs_string_47[] = "[3][Not enough memory!][OK]";
static char cops_rs_string_48[] = "[3][File error.][OK]";
static char cops_rs_string_49[] = "[1][File not found.][OK]";
static char cops_rs_string_50[] = "[2][Reload Control Panels?][Yes|No]";
static char cops_rs_string_51[] = "[2][ | Save the CPX| configuration?][ OK | Cancel ]";
static char cops_rs_string_52[] = "[1][ | Stereo Sound   |    Is Not|  Available.][ OK ]";
static char cops_rs_string_53[] = "[1][Cannot open the control panel.][OK]";
static char cops_rs_string_54[] = "[2][Terminate COPS?][Yes|No]";
static char cops_rs_string_55[] = "OK";
static char cops_rs_string_56[] = "Cancel";
static char cops_rs_string_57[] = "About COPS...";
static char cops_rs_string_58[] = "-";
static char cops_rs_string_59[] = "Settings...      ^E";
static char cops_rs_string_60[] = "-";
static char cops_rs_string_61[] = "Reload";
static char cops_rs_string_62[] = "Tidy Up";
static char cops_rs_string_63[] = "-";
static char cops_rs_string_64[] = "Select All       ^A";
static char cops_rs_string_65[] = "-";
static char cops_rs_string_66[] = "Help           HELP";
static char cops_rs_string_67[] = "Open         ^O";
static char cops_rs_string_68[] = "-";
static char cops_rs_string_69[] = "Deactivate";
static char cops_rs_string_70[] = "Activate";
static char cops_rs_string_71[] = "-";
static char cops_rs_string_72[] = "Info...      ^I";
static char cops_rs_string_73[] = "by";
static char cops_rs_string_74[] = "File name  :";
static char cops_rs_string_75[] = "  Version  :";
static char cops_rs_string_76[] = "       ID  :";
static char cops_rs_string_77[] = " Configuration ";
static char cops_rs_string_78[] = "RAM resident";
static char cops_rs_string_79[] = "Set Only";
static char cops_rs_string_80[] = "Boot Init";
static char cops_rs_string_81[] = "Auto Boot";
static char cops_rs_string_82[] = "Settings";
static char cops_rs_string_83[] = "CPX Path:";
static char cops_rs_string_84[] = "Iconify at start";
static char cops_rs_string_85[] = "Double click activates CPZ";
static char cops_rs_string_86[] = "Sort Icons by Name";
static char cops_rs_string_87[] = "Terminate after";
static char cops_rs_string_88[] = "__ minute(s)";
static char cops_rs_string_89[] = " Kontrollfelder ";
static char cops_rs_string_90[] = "  Kontrollfelder";
static char cops_rs_string_91[] = "CPX-Pfad ausw\204hlen";
static char cops_rs_string_92[] = "AES noch nicht aktiv.";
static char cops_rs_string_93[] = "[1][Keine weiteren Fenster.][Abbruch]";
static char cops_rs_string_94[] = "[2][Voreinstellungen sichern?][Ja|Nein]";
static char cops_rs_string_95[] = "[3][Nicht gen\201gend Speicher!][OK]";
static char cops_rs_string_96[] = "[3][Schreib- oder Lesefehler.][OK]";
static char cops_rs_string_97[] = "[1][Datei nicht gefunden.][OK]";
static char cops_rs_string_98[] = "[2][Alle Kontrollfelder neuladen?][Ja|Nein]";
static char cops_rs_string_99[] = "[2][ | CPX-Konfiguration | sichern? ][ OK | Abbruch ]";
static char cops_rs_string_100[] = "[1][ | Stereo-Sound  | nicht m\224glich!  ][ OK ]";
static char cops_rs_string_101[] = "[1][Beim \231ffnen des Kontrollfelds|ist ein Fehler aufgetreten.][OK]";
static char cops_rs_string_102[] = "[2][COPS beenden?][Ja|Nein]";
static char cops_rs_string_103[] = "Abbruch";
static char cops_rs_string_104[] = "\232ber COPS...";
static char cops_rs_string_105[] = "-";
static char cops_rs_string_106[] = "Einstellungen... ^E";
static char cops_rs_string_107[] = "-";
static char cops_rs_string_108[] = "Neuladen";
static char cops_rs_string_109[] = "Aufr\204umen";
static char cops_rs_string_110[] = "-";
static char cops_rs_string_111[] = "Alles markieren  ^A";
static char cops_rs_string_112[] = "-";
static char cops_rs_string_113[] = "Hilfe          HELP";
static char cops_rs_string_114[] = "\231ffnen       ^O";
static char cops_rs_string_115[] = "-";
static char cops_rs_string_116[] = "Deaktivieren";
static char cops_rs_string_117[] = "Aktivieren";
static char cops_rs_string_118[] = "-";
static char cops_rs_string_119[] = "Info...      ^I";
static char cops_rs_string_120[] = "von";
static char cops_rs_string_121[] = "Dateiname  :";
static char cops_rs_string_122[] = "  Version  :";
static char cops_rs_string_123[] = "  Kennung  :";
static char cops_rs_string_124[] = " Konfiguration ";
static char cops_rs_string_125[] = "RAM-resident";
static char cops_rs_string_126[] = "Nur setzen";
static char cops_rs_string_127[] = "Boot-Init";
static char cops_rs_string_128[] = "Automatisch starten";
static char cops_rs_string_129[] = "Einstellungen";
static char cops_rs_string_130[] = "CPX-Pfad:";
static char cops_rs_string_131[] = "Beim Start ikonifizieren";
static char cops_rs_string_132[] = "Doppelklick aktiviert CPZ";
static char cops_rs_string_133[] = "CPXe nach Namen ordnen";
static char cops_rs_string_134[] = "Beenden nach";
static char cops_rs_string_135[] = "__ Minute(n)";
static char cops_rs_string_136[] = " Panneaux contr\223le ";
static char cops_rs_string_137[] = "  Panneaux contr\223le";
static char cops_rs_string_138[] = "Choisir chemin CPX";
static char cops_rs_string_139[] = "AES pas encore activ.";
static char cops_rs_string_140[] = "[1][Plus des fen\210tres !][Abandon]";
static char cops_rs_string_141[] = "[2][Sauver r\202glages ?][Oui|Non]";
static char cops_rs_string_142[] = "[3][M\202moire insuffisante !][OK]";
static char cops_rs_string_143[] = "[3][Erreur de lecture |ou d\'\202criture !][OK]";
static char cops_rs_string_144[] = "[1][Fichier introuvable !][OK]";
static char cops_rs_string_145[] = "[2][Recharger toutes les CPX ?][Oui|Non]";
static char cops_rs_string_146[] = "[2][ | Sauver la | configuration? ][ CONFIRME | Annule ]";
static char cops_rs_string_147[] = "[1][ | Le son st\202r\202o | n\'est pas | disponible. ][ CONFIRME ]";
static char cops_rs_string_148[] = "[1][Erreur lors de l\'ouverture|du panneau de contr\223le.][OK]";
static char cops_rs_string_149[] = "[2][Quitter COPS?][Oui|Non]";
static char cops_rs_string_150[] = "Abandon";
static char cops_rs_string_151[] = "\266 propos de COPS...";
static char cops_rs_string_152[] = "-";
static char cops_rs_string_153[] = "R\202glages...       ^E";
static char cops_rs_string_154[] = "-";
static char cops_rs_string_155[] = "Recharger";
static char cops_rs_string_156[] = "Ranger";
static char cops_rs_string_157[] = "-";
static char cops_rs_string_158[] = "Tous s\202lectionner ^A";
static char cops_rs_string_159[] = "-";
static char cops_rs_string_160[] = "Aide            HELP";
static char cops_rs_string_161[] = "Ouvrir       ^O";
static char cops_rs_string_162[] = "-";
static char cops_rs_string_163[] = "D\202sactiver";
static char cops_rs_string_164[] = "Activer";
static char cops_rs_string_165[] = "-";
static char cops_rs_string_166[] = "Info...      ^I";
static char cops_rs_string_167[] = "de";
static char cops_rs_string_168[] = "Nom fichier:";
static char cops_rs_string_169[] = "    Version:";
static char cops_rs_string_170[] = "  Indicatif:";
static char cops_rs_string_171[] = " Configuration ";
static char cops_rs_string_172[] = "RAM-r\202sidente";
static char cops_rs_string_173[] = "Appliquer uniquement";
static char cops_rs_string_174[] = "Init-boot";
static char cops_rs_string_175[] = "Lancement automatique";
static char cops_rs_string_176[] = "R\202glages";
static char cops_rs_string_177[] = "Chemin CPX:";
static char cops_rs_string_178[] = "Ic\223nifier au demarrage";
static char cops_rs_string_179[] = "Double-clique active CPZ";
static char cops_rs_string_180[] = "Classer Ic\223nes par nom";
static char cops_rs_string_181[] = "Terminer apr\212s";
static char cops_rs_string_182[] = "__ minute(s)";
static char cops_rs_string_183[] = " Panel de Control ";
static char cops_rs_string_184[] = "  Panel de Control";
static char cops_rs_string_185[] = "Seleccione carpeta CPX";
static char cops_rs_string_186[] = "AES est\240 inactiva.";
static char cops_rs_string_187[] = "[1][No mas ventanas][Cancelar]";
static char cops_rs_string_188[] = "[2][ | Grabar valores por | defecto?   ][CONFIRMAR| Anular ]";
static char cops_rs_string_189[] = "[1][ | Error de     | ubicaci\242n de    | memoria!   ][ CONFIRMAR ]";
static char cops_rs_string_190[] = "[1][ | Error en  | fichero E/S!   ][ CONFIRMAR ]";
static char cops_rs_string_191[] = "[1][ | Fichero no   | encontrado! ][ CONFIRMAR ]";
static char cops_rs_string_192[] = "[2][ | Cargar CPXs? ][CONFIRMAR| Anular ]";
static char cops_rs_string_193[] = "[2][ | Grabar la Configuraci\242n | del CPX?   ][CONFIRMAR| Anular ]";
static char cops_rs_string_194[] = "[1][ | Sonido Est\202reo  | no disponible.   ][ CONFIRMAR ]";
static char cops_rs_string_195[] = "[1][No se puede abrir el panel de control.][OK]";
static char cops_rs_string_196[] = "[2][ | Suprimir el COPS?][CONFIRMAR| Anular ]";
static char cops_rs_string_197[] = "OK";
static char cops_rs_string_198[] = "Anular";
static char cops_rs_string_199[] = "Acerca de COPS...";
static char cops_rs_string_200[] = "-";
static char cops_rs_string_201[] = "Configuraciones   ^E";
static char cops_rs_string_202[] = "-";
static char cops_rs_string_203[] = "Recargar";
static char cops_rs_string_204[] = "Ordena";
static char cops_rs_string_205[] = "-";
static char cops_rs_string_206[] = "Seleccionar todo  ^A";
static char cops_rs_string_207[] = "-";
static char cops_rs_string_208[] = "Ayuda           HELP";
static char cops_rs_string_209[] = "Abrir          ^O";
static char cops_rs_string_210[] = "-";
static char cops_rs_string_211[] = "Desactivar";
static char cops_rs_string_212[] = "Activar";
static char cops_rs_string_213[] = "-";
static char cops_rs_string_214[] = "Informacion... ^I";
static char cops_rs_string_215[] = "Por";
static char cops_rs_string_216[] = "  Fichero  :";
static char cops_rs_string_217[] = "  Versi\242n  :";
static char cops_rs_string_218[] = "       ID  :";
static char cops_rs_string_219[] = " Configuraci\242n ";
static char cops_rs_string_220[] = "RAM residente";
static char cops_rs_string_221[] = "Solo set";
static char cops_rs_string_222[] = "Arranque init";
static char cops_rs_string_223[] = "Arranque autom\240tico";
static char cops_rs_string_224[] = "Configuraciones";
static char cops_rs_string_225[] = "Ruta CPX:";
static char cops_rs_string_226[] = "Iconify al inicio";
static char cops_rs_string_227[] = "Doble clic activa CPZ";
static char cops_rs_string_228[] = "Ordenar iconos por nombre";
static char cops_rs_string_229[] = "Terminar despu\202s";
static char cops_rs_string_230[] = "__ minuto(s)";
static char cops_rs_string_231[] = " Pannello di controllo ";
static char cops_rs_string_232[] = "  Control Panel";
static char cops_rs_string_233[] = "Seleziona il percorso CPX";
static char cops_rs_string_234[] = "AES \212 inattivo.";
static char cops_rs_string_235[] = "[1][Niente pi\227 finestre.][Annulla]";
static char cops_rs_string_236[] = "[2][ |  Salvo i parametri? ][ OK | Annulla ]";
static char cops_rs_string_237[] = "[1][ |  Errore di   |  allocazione   |  in memoria!   ][ OK ]";
static char cops_rs_string_238[] = "[3][   ||      Errore nel file!][SALTA|Riprova|Annulla]";
static char cops_rs_string_239[] = "[1][ | File non trovato! ][ OK ]";
static char cops_rs_string_240[] = "[2][ | Ricarico i CPX? ][ OK | Annulla ]";
static char cops_rs_string_241[] = "[2][ | Salvo la | configurazione | dei file CPX? ][ OK | Annulla ]";
static char cops_rs_string_242[] = "[1][ | Audio stereo non | disponibile. ][ OK ]";
static char cops_rs_string_243[] = "[1][Impossibile aprire il|pannello di controllo.][ OK ]";
static char cops_rs_string_244[] = "[2][Termina la COPS?][ OK | Annulla ]";
static char cops_rs_string_245[] = "OK";
static char cops_rs_string_246[] = "Annulla";
static char cops_rs_string_247[] = "Informazioni...";
static char cops_rs_string_248[] = "-";
static char cops_rs_string_249[] = "Installazione...  ^E";
static char cops_rs_string_250[] = "-";
static char cops_rs_string_251[] = "Ricaricare";
static char cops_rs_string_252[] = "Riordinare";
static char cops_rs_string_253[] = "-";
static char cops_rs_string_254[] = "Seleziona tutto   ^A";
static char cops_rs_string_255[] = "-";
static char cops_rs_string_256[] = "Aiuto           HELP";
static char cops_rs_string_257[] = "Aperto       ^O";
static char cops_rs_string_258[] = "-";
static char cops_rs_string_259[] = "Disattivo";
static char cops_rs_string_260[] = "Attivo";
static char cops_rs_string_261[] = "-";
static char cops_rs_string_262[] = "Info...      ^I";
static char cops_rs_string_263[] = "da";
static char cops_rs_string_264[] = "Nome file  :";
static char cops_rs_string_265[] = " Versione  :";
static char cops_rs_string_266[] = "       ID  :";
static char cops_rs_string_267[] = " Configurazione ";
static char cops_rs_string_268[] = "RAM residente";
static char cops_rs_string_269[] = "Imposta solo";
static char cops_rs_string_270[] = "Boot Init";
static char cops_rs_string_271[] = "Avvio automatico";
static char cops_rs_string_272[] = "Impostazioni";
static char cops_rs_string_273[] = "Percorso:";
static char cops_rs_string_274[] = "Iconify all\'inizio";
static char cops_rs_string_275[] = "Il doppio clic attiva CPZ";
static char cops_rs_string_276[] = "Ordina le icone per nome";
static char cops_rs_string_277[] = "Terminare dopo";
static char cops_rs_string_278[] = "__ minuti";
static char cops_rs_string_279[] = " Kontrollpanel ";
static char cops_rs_string_280[] = "  Kontrollpanel";
static char cops_rs_string_281[] = "V\204l CPX-s\224kv\204g";
static char cops_rs_string_282[] = "AES \204r inaktiv.";
static char cops_rs_string_283[] = "[1][Inga fler f\224nster.][ Avbryt ]";
static char cops_rs_string_284[] = "[2][ | Spara f\224rval? ][ OK | AVBRYT ]";
static char cops_rs_string_285[] = "[1][ | Fel vid minnes-  | tilldelning! ][ OK ]";
static char cops_rs_string_286[] = "[1][ | Fel vid | filoperation! ][ OK ]";
static char cops_rs_string_287[] = "[1][ | Filen ej funnen! ][ OK ]";
static char cops_rs_string_288[] = "[2][ | L\204s in CPXer p\206 nytt? ][ OK | AVBRYT ]";
static char cops_rs_string_289[] = "[2][ | Spara CPX- | inst\204llningar? ][ OK | AVBRYT ]";
static char cops_rs_string_290[] = "[1][ | Stereoljud ej   | tillg\204ngligt.   ][ OK ]";
static char cops_rs_string_291[] = "[1][Kan inte \224ppna kontrollpanelen.][OK]";
static char cops_rs_string_292[] = "[2][ | St\204nga av | kontrollpanelen? ][ OK | AVBRYT ]";
static char cops_rs_string_293[] = "OK";
static char cops_rs_string_294[] = "Avbryt";
static char cops_rs_string_295[] = "Om COPS...";
static char cops_rs_string_296[] = "-";
static char cops_rs_string_297[] = "Inst\204llningar...  ^E";
static char cops_rs_string_298[] = "-";
static char cops_rs_string_299[] = "Ladda om";
static char cops_rs_string_300[] = "St\204da upp";
static char cops_rs_string_301[] = "-";
static char cops_rs_string_302[] = "V\204lj alla         ^A";
static char cops_rs_string_303[] = "-";
static char cops_rs_string_304[] = "Hj\204lp           HELP";
static char cops_rs_string_305[] = "\231ppen        ^O";
static char cops_rs_string_306[] = "-";
static char cops_rs_string_307[] = "Deaktivera";
static char cops_rs_string_308[] = "Activera";
static char cops_rs_string_309[] = "-";
static char cops_rs_string_310[] = "Info...      ^I";
static char cops_rs_string_311[] = "av";
static char cops_rs_string_312[] = "  Filnamn  :";
static char cops_rs_string_313[] = "  Version  :";
static char cops_rs_string_314[] = "       ID  :";
static char cops_rs_string_315[] = " Konfiguration ";
static char cops_rs_string_316[] = "RAM permanent";
static char cops_rs_string_317[] = "St\204ll bara in";
static char cops_rs_string_318[] = "Starta init";
static char cops_rs_string_319[] = "Auto Boot";
static char cops_rs_string_320[] = "Inst\204llningar";
static char cops_rs_string_321[] = "S\224kv\204g:";
static char cops_rs_string_322[] = "Ikonifiera i b\224rjan";
static char cops_rs_string_323[] = "Dubbelklick aktiverar CPZ";
static char cops_rs_string_324[] = "Sortera ikoner efter namn";
static char cops_rs_string_325[] = "Avsluta efter";
static char cops_rs_string_326[] = "__ minut(er)";


static _UBYTE cops_rs_IMAGE0[] = {
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xE0, 0x00, 0x00, 0x00, 
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0xF0, 0x00, 0x00, 0x00, 0x0C, 0x00, 
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0xF8, 0x00, 0x00, 0x00, 0x7E, 0x00, 0x01, 0xFF, 
0x80, 0x07, 0xFF, 0xFC, 0x00, 0x0F, 0xFC, 0x00, 0x00, 0x01, 0xFF, 0x00, 0x0F, 0xFF, 0xF0, 0x07, 
0xFF, 0xFF, 0x80, 0x1F, 0xFE, 0x00, 0x00, 0x07, 0xFF, 0x80, 0x3F, 0xFF, 0xFC, 0x07, 0xFF, 0xFF, 
0xE0, 0x3F, 0xFF, 0x00, 0x00, 0x0F, 0xFF, 0x80, 0xFF, 0xFF, 0xFE, 0x07, 0xFF, 0xFF, 0xF0, 0x3F, 
0xFE, 0x00, 0x00, 0x1F, 0xFF, 0xC1, 0xFF, 0xFF, 0xFF, 0x03, 0xFF, 0x3F, 0xF8, 0x3F, 0xFC, 0x00, 
0x00, 0x3F, 0xFF, 0xE3, 0xFF, 0xFF, 0xFF, 0x83, 0xFE, 0x0F, 0xF8, 0x7F, 0xF8, 0x00, 0x00, 0x7F, 
0xFF, 0xC3, 0xFF, 0xFF, 0xFF, 0x83, 0xFE, 0x07, 0xFC, 0x7F, 0xF0, 0x00, 0x00, 0xFF, 0xFE, 0x07, 
0xFF, 0xFF, 0xFF, 0xC3, 0xFE, 0x03, 0xFC, 0x7F, 0xF0, 0x00, 0x00, 0xFF, 0xF8, 0x07, 0xFF, 0x83, 
0xFF, 0xC3, 0xFE, 0x03, 0xFE, 0x7F, 0xE0, 0x00, 0x01, 0xFF, 0xE0, 0x07, 0xFE, 0x00, 0xFF, 0xC3, 
0xFE, 0x01, 0xFE, 0x7F, 0xE0, 0x00, 0x01, 0xFF, 0xC0, 0x0F, 0xFC, 0x00, 0x7F, 0xE3, 0xFE, 0x01, 
0xFE, 0x3F, 0xE0, 0x00, 0x01, 0xFF, 0x80, 0x0F, 0xF8, 0x00, 0x3F, 0xE3, 0xFE, 0x01, 0xFE, 0x3F, 
0xF0, 0x00, 0x03, 0xFF, 0x80, 0x0F, 0xF8, 0x00, 0x3F, 0xE3, 0xFE, 0x03, 0xFE, 0x1F, 0xF8, 0x00, 
0x03, 0xFF, 0x00, 0x0F, 0xF0, 0x00, 0x1F, 0xE3, 0xFE, 0x03, 0xFE, 0x1F, 0xFC, 0x00, 0x03, 0xFF, 
0x00, 0x0F, 0xF0, 0x00, 0x1F, 0xE3, 0xFE, 0x07, 0xFE, 0x0F, 0xFE, 0x00, 0x03, 0xFF, 0x00, 0x0F, 
0xF0, 0x00, 0x1F, 0xE3, 0xFE, 0x1F, 0xFC, 0x07, 0xFF, 0x00, 0x03, 0xFF, 0x00, 0x0F, 0xF0, 0x00, 
0x1F, 0xE3, 0xFF, 0xFF, 0xFC, 0x03, 0xFF, 0x80, 0x03, 0xFF, 0x80, 0x0F, 0xF8, 0x00, 0x3F, 0xE3, 
0xFF, 0xFF, 0xF8, 0x01, 0xFF, 0x80, 0x01, 0xFF, 0x80, 0x0F, 0xF8, 0x00, 0x3F, 0xE3, 0xFF, 0xFF, 
0xF8, 0x01, 0xFF, 0xC0, 0x01, 0xFF, 0xC0, 0x0F, 0xFC, 0x00, 0x7F, 0xE3, 0xFF, 0xFF, 0xF0, 0x00, 
0xFF, 0xC0, 0x01, 0xFF, 0xE0, 0x07, 0xFE, 0x00, 0xFF, 0xC3, 0xFF, 0xFF, 0xC0, 0x00, 0xFF, 0xC0, 
0x00, 0xFF, 0xF8, 0x07, 0xFF, 0x83, 0xFF, 0xC3, 0xFF, 0xFE, 0x00, 0x00, 0xFF, 0xC0, 0x00, 0xFF, 
0xFE, 0x07, 0xFF, 0xFF, 0xFF, 0xC3, 0xFE, 0x00, 0x00, 0x01, 0xFF, 0xC0, 0x00, 0x7F, 0xFF, 0x83, 
0xFF, 0xFF, 0xFF, 0x83, 0xFE, 0x00, 0x00, 0x01, 0xFF, 0xC0, 0x00, 0x3F, 0xFF, 0xE3, 0xFF, 0xFF, 
0xFF, 0x83, 0xFE, 0x00, 0x00, 0x03, 0xFF, 0x80, 0x00, 0x1F, 0xFF, 0xC1, 0xFF, 0xFF, 0xFF, 0x03, 
0xFE, 0x00, 0x00, 0x0F, 0xFF, 0x80, 0x00, 0x0F, 0xFF, 0x80, 0xFF, 0xFF, 0xFE, 0x03, 0xFE, 0x00, 
0x00, 0x3F, 0xFF, 0x00, 0x00, 0x07, 0xFF, 0x80, 0x7F, 0xFF, 0xFC, 0x03, 0xFE, 0x00, 0x00, 0x1F, 
0xFE, 0x00, 0x00, 0x01, 0xFF, 0x00, 0x3F, 0xFF, 0xF8, 0x07, 0xFF, 0x00, 0x00, 0x0F, 0xFC, 0x00, 
0x00, 0x00, 0x7E, 0x00, 0x0F, 0xFF, 0xE0, 0x07, 0xFF, 0x00, 0x00, 0x07, 0xF8, 0x00, 0x00, 0x00, 
0x0E, 0x00, 0x01, 0xFF, 0x00, 0x07, 0xFF, 0x00, 0x00, 0x01, 0xF0, 0x00, 0x00, 0x00, 0x00, 0x00, 
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xE0, 0x00};

/* mask of COPS_ICON */
static _UBYTE cops_rs_RS0_MMASK[] = {
0x7F, 0xFF, 0xFF, 0xFC, 0x7F, 0xFF, 0xFF, 0xFC, 0x7F, 0xFF, 0xFF, 0xFE, 0x7F, 0xFF, 0xFF, 0xFE, 
0x7F, 0xFF, 0xFF, 0xFE, 0x7F, 0xFF, 0xFF, 0xFE, 0x7F, 0xFF, 0xFF, 0xFE, 0x7F, 0xFF, 0xFF, 0xFE, 
0x7F, 0xFF, 0xFF, 0xFE, 0x7F, 0xFF, 0xFF, 0xFE, 0x7F, 0xFF, 0xFF, 0xFE, 0x7F, 0xFF, 0xFF, 0xFE, 
0x7F, 0xFF, 0xFF, 0xFE, 0x7F, 0xFF, 0xFF, 0xFE, 0x7F, 0xFF, 0xFF, 0xFE, 0x7F, 0xFF, 0xFF, 0xFE, 
0x7F, 0xFF, 0xFF, 0xFE, 0x7F, 0xFF, 0xFF, 0xFE, 0x7F, 0xFF, 0xFF, 0xFE, 0x7F, 0xFF, 0xFF, 0xFE, 
0x7F, 0xFF, 0xFF, 0xFE, 0x7F, 0xFF, 0xFF, 0xFE, 0x7F, 0xFF, 0xFF, 0xFE, 0x7F, 0xFF, 0xFF, 0xFE, 
0x7F, 0xFF, 0xFF, 0xFE, 0x7F, 0xFF, 0xFF, 0xFE, 0x7F, 0xFF, 0xFF, 0xFE, 0x7F, 0xFF, 0xFF, 0xFE, 
0x7F, 0xFF, 0xFF, 0xFE, 0x7F, 0xFF, 0xFF, 0xFE, 0x1F, 0xFF, 0xFF, 0xFE, 0x00, 0x00, 0x00, 0x00};

/* data of COPS_ICON */
static _UBYTE cops_rs_RS0_MDATA[] = {
0x7F, 0xFF, 0xFF, 0xFC, 0x40, 0x00, 0x00, 0x04, 0x55, 0x55, 0x55, 0x56, 0x40, 0x00, 0x00, 0x06, 
0x7F, 0xFF, 0xFF, 0xFE, 0x40, 0x00, 0x04, 0x06, 0x40, 0x00, 0x04, 0x06, 0x40, 0x00, 0x04, 0x46, 
0x40, 0x00, 0x04, 0xE6, 0x40, 0x00, 0x04, 0xA6, 0x40, 0x00, 0x04, 0xE6, 0x40, 0x00, 0x04, 0xE6, 
0x40, 0x00, 0x04, 0xA6, 0x40, 0x00, 0x04, 0xE6, 0x40, 0x00, 0x05, 0xF6, 0x40, 0x00, 0x05, 0x1E, 
0x40, 0x00, 0x05, 0x16, 0x40, 0x00, 0x05, 0xFE, 0x40, 0x00, 0x04, 0xF6, 0x40, 0x00, 0x04, 0xA6, 
0x40, 0x00, 0x04, 0xE6, 0x40, 0x00, 0x04, 0xE6, 0x40, 0x00, 0x04, 0xA6, 0x40, 0x00, 0x04, 0xE6, 
0x40, 0x00, 0x04, 0xE6, 0x40, 0x00, 0x04, 0xA6, 0x40, 0x00, 0x04, 0x46, 0x40, 0x00, 0x04, 0x06, 
0x40, 0x00, 0x04, 0x06, 0x7F, 0xFF, 0xFF, 0xFE, 0x1F, 0xFF, 0xFF, 0xFE, 0x00, 0x00, 0x00, 0x00};

/* color data of COPS_ICON */
static _UBYTE cops_rs_RS0_4CDATA[] = {
0x7F, 0xFF, 0xFF, 0xFC, 0x7F, 0xFF, 0xFF, 0xFA, 0x40, 0x00, 0x00, 0x02, 0x7F, 0xFF, 0xFF, 0xFA, 
0x6A, 0xAA, 0xAC, 0xAA, 0x55, 0x55, 0x55, 0x12, 0x6A, 0xAA, 0xAC, 0xEA, 0x55, 0x55, 0x55, 0xB2, 
0x6A, 0xAA, 0xAC, 0xAA, 0x55, 0x55, 0x55, 0xB2, 0x6A, 0xAA, 0xAC, 0xAA, 0x55, 0x55, 0x55, 0xB2, 
0x6A, 0xAA, 0xAC, 0xAA, 0x55, 0x55, 0x55, 0xF2, 0x6A, 0xAA, 0xAD, 0xB2, 0x55, 0x55, 0x55, 0x52, 
0x6A, 0xAA, 0xAD, 0xF2, 0x55, 0x55, 0x55, 0xA2, 0x6A, 0xAA, 0xAC, 0xAA, 0x55, 0x55, 0x55, 0xB2, 
0x6A, 0xAA, 0xAC, 0xAA, 0x55, 0x55, 0x55, 0xB2, 0x6A, 0xAA, 0xAC, 0xAA, 0x55, 0x55, 0x55, 0xB2, 
0x6A, 0xAA, 0xAC, 0xAA, 0x55, 0x55, 0x55, 0x52, 0x6A, 0xAA, 0xAC, 0xAA, 0x55, 0x55, 0x55, 0x52, 
0x6A, 0xAA, 0xAC, 0xAA, 0x40, 0x00, 0x00, 0x02, 0x3F, 0xFF, 0xFF, 0xFE, 0x00, 0x00, 0x00, 0x00, 
0x7F, 0xFF, 0xFF, 0xFC, 0x7F, 0xFF, 0xFF, 0xFA, 0x40, 0x00, 0x00, 0x02, 0x7F, 0xFF, 0xFF, 0xFA, 
0x6A, 0xAA, 0xAC, 0xAA, 0x55, 0x55, 0x55, 0x12, 0x6A, 0xAA, 0xAC, 0xEA, 0x55, 0x55, 0x55, 0xB2, 
0x6A, 0xAA, 0xAC, 0xAA, 0x55, 0x55, 0x55, 0xB2, 0x6A, 0xAA, 0xAC, 0xAA, 0x55, 0x55, 0x55, 0xB2, 
0x6A, 0xAA, 0xAC, 0xAA, 0x55, 0x55, 0x55, 0xF2, 0x6A, 0xAA, 0xAD, 0xB2, 0x55, 0x55, 0x55, 0x52, 
0x6A, 0xAA, 0xAD, 0xF2, 0x55, 0x55, 0x55, 0xA2, 0x6A, 0xAA, 0xAC, 0xAA, 0x55, 0x55, 0x55, 0xB2, 
0x6A, 0xAA, 0xAC, 0xAA, 0x55, 0x55, 0x55, 0xB2, 0x6A, 0xAA, 0xAC, 0xAA, 0x55, 0x55, 0x55, 0xB2, 
0x6A, 0xAA, 0xAC, 0xAA, 0x55, 0x55, 0x55, 0x52, 0x6A, 0xAA, 0xAC, 0xAA, 0x55, 0x55, 0x55, 0x52, 
0x6A, 0xAA, 0xAC, 0xAA, 0x40, 0x00, 0x00, 0x02, 0x3F, 0xFF, 0xFF, 0xFE, 0x00, 0x00, 0x00, 0x00, 
0x7F, 0xFF, 0xFF, 0xFC, 0x7F, 0xFF, 0xFF, 0xFA, 0x40, 0x00, 0x00, 0x02, 0x7F, 0xFF, 0xFF, 0xFA, 
0x6A, 0xAA, 0xAC, 0xAA, 0x55, 0x55, 0x55, 0x12, 0x6A, 0xAA, 0xAC, 0xEA, 0x55, 0x55, 0x55, 0xB2, 
0x6A, 0xAA, 0xAC, 0xAA, 0x55, 0x55, 0x55, 0xB2, 0x6A, 0xAA, 0xAC, 0xAA, 0x55, 0x55, 0x55, 0xB2, 
0x6A, 0xAA, 0xAC, 0xAA, 0x55, 0x55, 0x55, 0xF2, 0x6A, 0xAA, 0xAD, 0xB2, 0x55, 0x55, 0x55, 0x52, 
0x6A, 0xAA, 0xAD, 0xF2, 0x55, 0x55, 0x55, 0xA2, 0x6A, 0xAA, 0xAC, 0xAA, 0x55, 0x55, 0x55, 0xB2, 
0x6A, 0xAA, 0xAC, 0xAA, 0x55, 0x55, 0x55, 0xB2, 0x6A, 0xAA, 0xAC, 0xAA, 0x55, 0x55, 0x55, 0xB2, 
0x6A, 0xAA, 0xAC, 0xAA, 0x55, 0x55, 0x55, 0x52, 0x6A, 0xAA, 0xAC, 0xAA, 0x55, 0x55, 0x55, 0x52, 
0x6A, 0xAA, 0xAC, 0xAA, 0x40, 0x00, 0x00, 0x02, 0x3F, 0xFF, 0xFF, 0xFE, 0x00, 0x00, 0x00, 0x00, 
0x7F, 0xFF, 0xFF, 0xFC, 0x40, 0x00, 0x00, 0x06, 0x7F, 0xFF, 0xFF, 0xFE, 0x7F, 0xFF, 0xFF, 0xFE, 
0x40, 0x00, 0x04, 0x06, 0x40, 0x00, 0x04, 0x06, 0x40, 0x00, 0x04, 0x46, 0x40, 0x00, 0x04, 0xE6, 
0x40, 0x00, 0x04, 0xE6, 0x40, 0x00, 0x04, 0xE6, 0x40, 0x00, 0x04, 0xE6, 0x40, 0x00, 0x04, 0xE6, 
0x40, 0x00, 0x04, 0xE6, 0x40, 0x00, 0x05, 0xF6, 0x40, 0x00, 0x05, 0x1E, 0x40, 0x00, 0x05, 0x1E, 
0x40, 0x00, 0x05, 0xFE, 0x40, 0x00, 0x04, 0xFE, 0x40, 0x00, 0x04, 0xF6, 0x40, 0x00, 0x04, 0xE6, 
0x40, 0x00, 0x04, 0xE6, 0x40, 0x00, 0x04, 0xE6, 0x40, 0x00, 0x04, 0xE6, 0x40, 0x00, 0x04, 0xE6, 
0x40, 0x00, 0x04, 0xE6, 0x40, 0x00, 0x04, 0x46, 0x40, 0x00, 0x04, 0x06, 0x40, 0x00, 0x04, 0x06, 
0x40, 0x00, 0x04, 0x06, 0x7F, 0xFF, 0xFF, 0xFE, 0x3F, 0xFF, 0xFF, 0xFE, 0x00, 0x00, 0x00, 0x00};

/* color mask of COPS_ICON */
static _UBYTE cops_rs_RS0_4CMASK[] = {
0x7F, 0xFF, 0xFF, 0xFC, 0x7F, 0xFF, 0xFF, 0xFE, 0x7F, 0xFF, 0xFF, 0xFE, 0x7F, 0xFF, 0xFF, 0xFE, 
0x7F, 0xFF, 0xFF, 0xFE, 0x7F, 0xFF, 0xFF, 0xFE, 0x7F, 0xFF, 0xFF, 0xFE, 0x7F, 0xFF, 0xFF, 0xFE, 
0x7F, 0xFF, 0xFF, 0xFE, 0x7F, 0xFF, 0xFF, 0xFE, 0x7F, 0xFF, 0xFF, 0xFE, 0x7F, 0xFF, 0xFF, 0xFE, 
0x7F, 0xFF, 0xFF, 0xFE, 0x7F, 0xFF, 0xFF, 0xFE, 0x7F, 0xFF, 0xFF, 0xFE, 0x7F, 0xFF, 0xFF, 0xFE, 
0x7F, 0xFF, 0xFF, 0xFE, 0x7F, 0xFF, 0xFF, 0xFE, 0x7F, 0xFF, 0xFF, 0xFE, 0x7F, 0xFF, 0xFF, 0xFE, 
0x7F, 0xFF, 0xFF, 0xFE, 0x7F, 0xFF, 0xFF, 0xFE, 0x7F, 0xFF, 0xFF, 0xFE, 0x7F, 0xFF, 0xFF, 0xFE, 
0x7F, 0xFF, 0xFF, 0xFE, 0x7F, 0xFF, 0xFF, 0xFE, 0x7F, 0xFF, 0xFF, 0xFE, 0x7F, 0xFF, 0xFF, 0xFE, 
0x7F, 0xFF, 0xFF, 0xFE, 0x7F, 0xFF, 0xFF, 0xFE, 0x3F, 0xFF, 0xFF, 0xFE, 0x00, 0x00, 0x00, 0x00};

/* data of INACTIVE_IMG */
static _UBYTE cops_rs_IMAGE1[] = {
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 
0x00, 0x00, 0x0F, 0xFE, 0xFF, 0x00, 0x7F, 0xFC, 0x7F, 0xF9, 0xFF, 0xF0, 0x1F, 0xFF, 0xFF, 0xC0, 
0x03, 0xFF, 0xFE, 0x00, 0x00, 0x7F, 0xFC, 0x00, 0x00, 0xFF, 0xFF, 0x00, 0x03, 0xFF, 0xFF, 0xC0, 
0x07, 0xFC, 0xFF, 0xF0, 0x1F, 0xF0, 0x1F, 0xF8, 0x3F, 0xC0, 0x07, 0xFC, 0x7F, 0x00, 0x01, 0xFE, 
0xFC, 0x00, 0x00, 0x7F, 0xF8, 0x00, 0x00, 0x1F, 0xE0, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x03, 
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};


char *rs_frstr[NUM_FRSTR] = {
	cops_rs_string_40,
	cops_rs_string_41,
	cops_rs_string_42,
	cops_rs_string_43,
	cops_rs_string_44,
	cops_rs_string_45,
	cops_rs_string_46,
	cops_rs_string_47,
	cops_rs_string_48,
	cops_rs_string_49,
	cops_rs_string_50,
	cops_rs_string_51,
	cops_rs_string_52,
	cops_rs_string_53,
	cops_rs_string_54,
	cops_rs_string_55,
	cops_rs_string_56,
	cops_rs_string_57,
	cops_rs_string_58,
	cops_rs_string_59,
	cops_rs_string_60,
	cops_rs_string_61,
	cops_rs_string_62,
	cops_rs_string_63,
	cops_rs_string_64,
	cops_rs_string_65,
	cops_rs_string_66,
	cops_rs_string_67,
	cops_rs_string_68,
	cops_rs_string_69,
	cops_rs_string_70,
	cops_rs_string_71,
	cops_rs_string_72,
	cops_rs_string_73,
	cops_rs_string_74,
	cops_rs_string_75,
	cops_rs_string_76,
	cops_rs_string_77,
	cops_rs_string_78,
	cops_rs_string_79,
	cops_rs_string_80,
	cops_rs_string_81,
	cops_rs_string_82,
	cops_rs_string_83,
	cops_rs_string_84,
	cops_rs_string_85,
	cops_rs_string_86,
	cops_rs_string_87,
	cops_rs_string_88,
	cops_rs_string_89,
	cops_rs_string_90,
	cops_rs_string_91,
	cops_rs_string_92,
	cops_rs_string_93,
	cops_rs_string_94,
	cops_rs_string_95,
	cops_rs_string_96,
	cops_rs_string_97,
	cops_rs_string_98,
	cops_rs_string_99,
	cops_rs_string_100,
	cops_rs_string_101,
	cops_rs_string_102,
	cops_rs_string_103,
	cops_rs_string_104,
	cops_rs_string_105,
	cops_rs_string_106,
	cops_rs_string_107,
	cops_rs_string_108,
	cops_rs_string_109,
	cops_rs_string_110,
	cops_rs_string_111,
	cops_rs_string_112,
	cops_rs_string_113,
	cops_rs_string_114,
	cops_rs_string_115,
	cops_rs_string_116,
	cops_rs_string_117,
	cops_rs_string_118,
	cops_rs_string_119,
	cops_rs_string_120,
	cops_rs_string_121,
	cops_rs_string_122,
	cops_rs_string_123,
	cops_rs_string_124,
	cops_rs_string_125,
	cops_rs_string_126,
	cops_rs_string_127,
	cops_rs_string_128,
	cops_rs_string_129,
	cops_rs_string_130,
	cops_rs_string_131,
	cops_rs_string_132,
	cops_rs_string_133,
	cops_rs_string_134,
	cops_rs_string_135,
	cops_rs_string_136,
	cops_rs_string_137,
	cops_rs_string_138,
	cops_rs_string_139,
	cops_rs_string_140,
	cops_rs_string_141,
	cops_rs_string_142,
	cops_rs_string_143,
	cops_rs_string_144,
	cops_rs_string_145,
	cops_rs_string_146,
	cops_rs_string_147,
	cops_rs_string_148,
	cops_rs_string_149,
	cops_rs_string_150,
	cops_rs_string_151,
	cops_rs_string_152,
	cops_rs_string_153,
	cops_rs_string_154,
	cops_rs_string_155,
	cops_rs_string_156,
	cops_rs_string_157,
	cops_rs_string_158,
	cops_rs_string_159,
	cops_rs_string_160,
	cops_rs_string_161,
	cops_rs_string_162,
	cops_rs_string_163,
	cops_rs_string_164,
	cops_rs_string_165,
	cops_rs_string_166,
	cops_rs_string_167,
	cops_rs_string_168,
	cops_rs_string_169,
	cops_rs_string_170,
	cops_rs_string_171,
	cops_rs_string_172,
	cops_rs_string_173,
	cops_rs_string_174,
	cops_rs_string_175,
	cops_rs_string_176,
	cops_rs_string_177,
	cops_rs_string_178,
	cops_rs_string_179,
	cops_rs_string_180,
	cops_rs_string_181,
	cops_rs_string_182,
	cops_rs_string_183,
	cops_rs_string_184,
	cops_rs_string_185,
	cops_rs_string_186,
	cops_rs_string_187,
	cops_rs_string_188,
	cops_rs_string_189,
	cops_rs_string_190,
	cops_rs_string_191,
	cops_rs_string_192,
	cops_rs_string_193,
	cops_rs_string_194,
	cops_rs_string_195,
	cops_rs_string_196,
	cops_rs_string_197,
	cops_rs_string_198,
	cops_rs_string_199,
	cops_rs_string_200,
	cops_rs_string_201,
	cops_rs_string_202,
	cops_rs_string_203,
	cops_rs_string_204,
	cops_rs_string_205,
	cops_rs_string_206,
	cops_rs_string_207,
	cops_rs_string_208,
	cops_rs_string_209,
	cops_rs_string_210,
	cops_rs_string_211,
	cops_rs_string_212,
	cops_rs_string_213,
	cops_rs_string_214,
	cops_rs_string_215,
	cops_rs_string_216,
	cops_rs_string_217,
	cops_rs_string_218,
	cops_rs_string_219,
	cops_rs_string_220,
	cops_rs_string_221,
	cops_rs_string_222,
	cops_rs_string_223,
	cops_rs_string_224,
	cops_rs_string_225,
	cops_rs_string_226,
	cops_rs_string_227,
	cops_rs_string_228,
	cops_rs_string_229,
	cops_rs_string_230,
	cops_rs_string_231,
	cops_rs_string_232,
	cops_rs_string_233,
	cops_rs_string_234,
	cops_rs_string_235,
	cops_rs_string_236,
	cops_rs_string_237,
	cops_rs_string_238,
	cops_rs_string_239,
	cops_rs_string_240,
	cops_rs_string_241,
	cops_rs_string_242,
	cops_rs_string_243,
	cops_rs_string_244,
	cops_rs_string_245,
	cops_rs_string_246,
	cops_rs_string_247,
	cops_rs_string_248,
	cops_rs_string_249,
	cops_rs_string_250,
	cops_rs_string_251,
	cops_rs_string_252,
	cops_rs_string_253,
	cops_rs_string_254,
	cops_rs_string_255,
	cops_rs_string_256,
	cops_rs_string_257,
	cops_rs_string_258,
	cops_rs_string_259,
	cops_rs_string_260,
	cops_rs_string_261,
	cops_rs_string_262,
	cops_rs_string_263,
	cops_rs_string_264,
	cops_rs_string_265,
	cops_rs_string_266,
	cops_rs_string_267,
	cops_rs_string_268,
	cops_rs_string_269,
	cops_rs_string_270,
	cops_rs_string_271,
	cops_rs_string_272,
	cops_rs_string_273,
	cops_rs_string_274,
	cops_rs_string_275,
	cops_rs_string_276,
	cops_rs_string_277,
	cops_rs_string_278,
	cops_rs_string_279,
	cops_rs_string_280,
	cops_rs_string_281,
	cops_rs_string_282,
	cops_rs_string_283,
	cops_rs_string_284,
	cops_rs_string_285,
	cops_rs_string_286,
	cops_rs_string_287,
	cops_rs_string_288,
	cops_rs_string_289,
	cops_rs_string_290,
	cops_rs_string_291,
	cops_rs_string_292,
	cops_rs_string_293,
	cops_rs_string_294,
	cops_rs_string_295,
	cops_rs_string_296,
	cops_rs_string_297,
	cops_rs_string_298,
	cops_rs_string_299,
	cops_rs_string_300,
	cops_rs_string_301,
	cops_rs_string_302,
	cops_rs_string_303,
	cops_rs_string_304,
	cops_rs_string_305,
	cops_rs_string_306,
	cops_rs_string_307,
	cops_rs_string_308,
	cops_rs_string_309,
	cops_rs_string_310,
	cops_rs_string_311,
	cops_rs_string_312,
	cops_rs_string_313,
	cops_rs_string_314,
	cops_rs_string_315,
	cops_rs_string_316,
	cops_rs_string_317,
	cops_rs_string_318,
	cops_rs_string_319,
	cops_rs_string_320,
	cops_rs_string_321,
	cops_rs_string_322,
	cops_rs_string_323,
	cops_rs_string_324,
	cops_rs_string_325,
	cops_rs_string_326
};


BITBLK rs_bitblk[NUM_BB] = {
	{ CP cops_rs_IMAGE0, 14, 35, 0, 0, 1 },
	{ CP cops_rs_IMAGE1, 4, 24, 0, 0, 1 }
};


CICON rs_cicon[] = {
	{ 4, (_WORD *) cops_rs_RS0_4CDATA, (_WORD *) cops_rs_RS0_4CMASK, 0, 0, 0 }
};


CICONBLK rs_ciconblk[] = {
	{ { (_WORD *) cops_rs_RS0_MMASK, (_WORD *) cops_rs_RS0_MDATA, cops_rs_string_11, 4096,0,0, 0,0,32,32, 0,-1,0,8 }, &rs_cicon[0] } /* COPS_ICON */
};



#define RSC_HAS_PALETTE 1
#ifndef RSC_USE_PALETTE
#  define RSC_USE_PALETTE 0
#endif
#if (RSC_STATIC_FILE && RSC_NAMED_FUNCTIONS) || RSC_USE_PALETTE
#if RSC_USE_PALETTE && !RSC_NAMED_FUNCTIONS && RSC_STATIC_FILE
_WORD rgb_palette[][4] = {
#else
_WORD rgb_palette[][4] = {
#endif
	{ 0x03E8, 0x03E8, 0x03E8, 0x0000 },
	{ 0x03C9, 0x003F, 0x0010, 0x0002 },
	{ 0x00BC, 0x035B, 0x005E, 0x0003 },
	{ 0x03D8, 0x03C9, 0x0010, 0x0006 },
	{ 0x008D, 0x003F, 0x03D8, 0x0004 },
	{ 0x0376, 0x00D0, 0x026C, 0x0007 },
	{ 0x005E, 0x0318, 0x02D9, 0x0005 },
	{ 0x0347, 0x0347, 0x0347, 0x0008 },
	{ 0x01EA, 0x01EA, 0x01EA, 0x0009 },
	{ 0x02AA, 0x003F, 0x0010, 0x000A },
	{ 0x008D, 0x01FA, 0x005E, 0x000B },
	{ 0x02CA, 0x027B, 0x00E0, 0x000E },
	{ 0x003F, 0x001F, 0x026C, 0x000C },
	{ 0x01BB, 0x006E, 0x012E, 0x000F },
	{ 0x003F, 0x020D, 0x01CF, 0x000D },
	{ 0x0000, 0x0000, 0x0000, 0x00FF },
	{ 0x03E8, 0x03E8, 0x03E8, 0x0010 },
	{ 0x03E8, 0x03E8, 0x03E8, 0x0011 },
	{ 0x039D, 0x039D, 0x039D, 0x0012 },
	{ 0x035B, 0x035B, 0x035B, 0x0013 },
	{ 0x0320, 0x0320, 0x0320, 0x0014 },
	{ 0x02D5, 0x02D5, 0x02D5, 0x0015 },
	{ 0x0293, 0x0293, 0x0293, 0x0016 },
	{ 0x0258, 0x0258, 0x0258, 0x0017 },
	{ 0x020D, 0x020D, 0x020D, 0x0018 },
	{ 0x01CB, 0x01CB, 0x01CB, 0x0019 },
	{ 0x0190, 0x0190, 0x0190, 0x001A },
	{ 0x0145, 0x0145, 0x0145, 0x001B },
	{ 0x0103, 0x0103, 0x0103, 0x001C },
	{ 0x00C8, 0x00C8, 0x00C8, 0x001D },
	{ 0x007D, 0x007D, 0x007D, 0x001E },
	{ 0x003B, 0x003B, 0x003B, 0x001F },
	{ 0x03E8, 0x0000, 0x0000, 0x0020 },
	{ 0x03E8, 0x0000, 0x003B, 0x0021 },
	{ 0x03E8, 0x0000, 0x007D, 0x0022 },
	{ 0x03E8, 0x0000, 0x00C8, 0x0023 },
	{ 0x03E8, 0x0000, 0x0103, 0x0024 },
	{ 0x03E8, 0x0000, 0x0145, 0x0025 },
	{ 0x03E8, 0x0000, 0x0190, 0x0026 },
	{ 0x03E8, 0x0000, 0x01CB, 0x0027 },
	{ 0x03E8, 0x0000, 0x020D, 0x0028 },
	{ 0x03E8, 0x0000, 0x0258, 0x0029 },
	{ 0x03E8, 0x0000, 0x0293, 0x002A },
	{ 0x03E8, 0x0000, 0x02D5, 0x002B },
	{ 0x03E8, 0x0000, 0x0320, 0x002C },
	{ 0x03E8, 0x0000, 0x035B, 0x002D },
	{ 0x03E8, 0x0000, 0x039D, 0x002E },
	{ 0x03E8, 0x0000, 0x03E8, 0x002F },
	{ 0x039D, 0x0000, 0x03E8, 0x0030 },
	{ 0x035B, 0x0000, 0x03E8, 0x0031 },
	{ 0x0320, 0x0000, 0x03E8, 0x0032 },
	{ 0x02D5, 0x0000, 0x03E8, 0x0033 },
	{ 0x0293, 0x0000, 0x03E8, 0x0034 },
	{ 0x0258, 0x0000, 0x03E8, 0x0035 },
	{ 0x020D, 0x0000, 0x03E8, 0x0036 },
	{ 0x01CB, 0x0000, 0x03E8, 0x0037 },
	{ 0x0190, 0x0000, 0x03E8, 0x0038 },
	{ 0x0145, 0x0000, 0x03E8, 0x0039 },
	{ 0x0103, 0x0000, 0x03E8, 0x003A },
	{ 0x00C8, 0x0000, 0x03E8, 0x003B },
	{ 0x007D, 0x0000, 0x03E8, 0x003C },
	{ 0x003B, 0x0000, 0x03E8, 0x003D },
	{ 0x0000, 0x0000, 0x03E8, 0x003E },
	{ 0x0000, 0x003B, 0x03E8, 0x003F },
	{ 0x0000, 0x007D, 0x03E8, 0x0040 },
	{ 0x0000, 0x00C8, 0x03E8, 0x0041 },
	{ 0x0000, 0x0103, 0x03E8, 0x0042 },
	{ 0x0000, 0x0145, 0x03E8, 0x0043 },
	{ 0x0000, 0x0190, 0x03E8, 0x0044 },
	{ 0x0000, 0x01CB, 0x03E8, 0x0045 },
	{ 0x0000, 0x020D, 0x03E8, 0x0046 },
	{ 0x0000, 0x0258, 0x03E8, 0x0047 },
	{ 0x0000, 0x0293, 0x03E8, 0x0048 },
	{ 0x0000, 0x02D5, 0x03E8, 0x0049 },
	{ 0x0000, 0x0320, 0x03E8, 0x004A },
	{ 0x0000, 0x035B, 0x03E8, 0x004B },
	{ 0x0000, 0x039D, 0x03E8, 0x004C },
	{ 0x0000, 0x03E8, 0x03E8, 0x004D },
	{ 0x0000, 0x03E8, 0x039D, 0x004E },
	{ 0x0000, 0x03E8, 0x035B, 0x004F },
	{ 0x0000, 0x03E8, 0x0320, 0x0050 },
	{ 0x0000, 0x03E8, 0x02D5, 0x0051 },
	{ 0x0000, 0x03E8, 0x0293, 0x0052 },
	{ 0x0000, 0x03E8, 0x0258, 0x0053 },
	{ 0x0000, 0x03E8, 0x020D, 0x0054 },
	{ 0x0000, 0x03E8, 0x01CB, 0x0055 },
	{ 0x0000, 0x03E8, 0x0190, 0x0056 },
	{ 0x0000, 0x03E8, 0x0145, 0x0057 },
	{ 0x0000, 0x03E8, 0x0103, 0x0058 },
	{ 0x0000, 0x03E8, 0x00C8, 0x0059 },
	{ 0x0000, 0x03E8, 0x007D, 0x005A },
	{ 0x0000, 0x03E8, 0x003B, 0x005B },
	{ 0x0000, 0x03E8, 0x0000, 0x005C },
	{ 0x003B, 0x03E8, 0x0000, 0x005D },
	{ 0x007D, 0x03E8, 0x0000, 0x005E },
	{ 0x00C8, 0x03E8, 0x0000, 0x005F },
	{ 0x0103, 0x03E8, 0x0000, 0x0060 },
	{ 0x0145, 0x03E8, 0x0000, 0x0061 },
	{ 0x0190, 0x03E8, 0x0000, 0x0062 },
	{ 0x01CB, 0x03E8, 0x0000, 0x0063 },
	{ 0x020D, 0x03E8, 0x0000, 0x0064 },
	{ 0x0258, 0x03E8, 0x0000, 0x0065 },
	{ 0x0293, 0x03E8, 0x0000, 0x0066 },
	{ 0x02D5, 0x03E8, 0x0000, 0x0067 },
	{ 0x0320, 0x03E8, 0x0000, 0x0068 },
	{ 0x035B, 0x03E8, 0x0000, 0x0069 },
	{ 0x039D, 0x03E8, 0x0000, 0x006A },
	{ 0x03E8, 0x03E8, 0x0000, 0x006B },
	{ 0x03E8, 0x039D, 0x0000, 0x006C },
	{ 0x03E8, 0x035B, 0x0000, 0x006D },
	{ 0x03E8, 0x0320, 0x0000, 0x006E },
	{ 0x03E8, 0x02D5, 0x0000, 0x006F },
	{ 0x03E8, 0x0293, 0x0000, 0x0070 },
	{ 0x03E8, 0x0258, 0x0000, 0x0071 },
	{ 0x03E8, 0x020D, 0x0000, 0x0072 },
	{ 0x03E8, 0x01CB, 0x0000, 0x0073 },
	{ 0x03E8, 0x0190, 0x0000, 0x0074 },
	{ 0x03E8, 0x0145, 0x0000, 0x0075 },
	{ 0x03E8, 0x0103, 0x0000, 0x0076 },
	{ 0x03E8, 0x00C8, 0x0000, 0x0077 },
	{ 0x03E8, 0x007D, 0x0000, 0x0078 },
	{ 0x03E8, 0x003B, 0x0000, 0x0079 },
	{ 0x02D5, 0x0000, 0x0000, 0x007A },
	{ 0x02D5, 0x0000, 0x003B, 0x007B },
	{ 0x02D5, 0x0000, 0x007D, 0x007C },
	{ 0x02D5, 0x0000, 0x00C8, 0x007D },
	{ 0x02D5, 0x0000, 0x0103, 0x007E },
	{ 0x02D5, 0x0000, 0x0145, 0x007F },
	{ 0x02D5, 0x0000, 0x0190, 0x0080 },
	{ 0x02D5, 0x0000, 0x01CB, 0x0081 },
	{ 0x02D5, 0x0000, 0x020D, 0x0082 },
	{ 0x02D5, 0x0000, 0x0258, 0x0083 },
	{ 0x02D5, 0x0000, 0x0293, 0x0084 },
	{ 0x02D5, 0x0000, 0x02D5, 0x0085 },
	{ 0x0293, 0x0000, 0x02D5, 0x0086 },
	{ 0x0258, 0x0000, 0x02D5, 0x0087 },
	{ 0x020D, 0x0000, 0x02D5, 0x0088 },
	{ 0x01CB, 0x0000, 0x02D5, 0x0089 },
	{ 0x0190, 0x0000, 0x02D5, 0x008A },
	{ 0x0145, 0x0000, 0x02D5, 0x008B },
	{ 0x0103, 0x0000, 0x02D5, 0x008C },
	{ 0x00C8, 0x0000, 0x02D5, 0x008D },
	{ 0x007D, 0x0000, 0x02D5, 0x008E },
	{ 0x003B, 0x0000, 0x02D5, 0x008F },
	{ 0x0000, 0x0000, 0x02D5, 0x0090 },
	{ 0x0000, 0x003B, 0x02D5, 0x0091 },
	{ 0x0000, 0x007D, 0x02D5, 0x0092 },
	{ 0x0000, 0x00C8, 0x02D5, 0x0093 },
	{ 0x0000, 0x0103, 0x02D5, 0x0094 },
	{ 0x0000, 0x0145, 0x02D5, 0x0095 },
	{ 0x0000, 0x0190, 0x02D5, 0x0096 },
	{ 0x0000, 0x01CB, 0x02D5, 0x0097 },
	{ 0x0000, 0x020D, 0x02D5, 0x0098 },
	{ 0x0000, 0x0258, 0x02D5, 0x0099 },
	{ 0x0000, 0x0293, 0x02D5, 0x009A },
	{ 0x0000, 0x02D5, 0x02D5, 0x009B },
	{ 0x0000, 0x02D5, 0x0293, 0x009C },
	{ 0x0000, 0x02D5, 0x0258, 0x009D },
	{ 0x0000, 0x02D5, 0x020D, 0x009E },
	{ 0x0000, 0x02D5, 0x01CB, 0x009F },
	{ 0x0000, 0x02D5, 0x0190, 0x00A0 },
	{ 0x0000, 0x02D5, 0x0145, 0x00A1 },
	{ 0x0000, 0x02D5, 0x0103, 0x00A2 },
	{ 0x0000, 0x02D5, 0x00C8, 0x00A3 },
	{ 0x0000, 0x02D5, 0x007D, 0x00A4 },
	{ 0x0000, 0x02D5, 0x003B, 0x00A5 },
	{ 0x0000, 0x02D5, 0x0000, 0x00A6 },
	{ 0x003B, 0x02D5, 0x0000, 0x00A7 },
	{ 0x007D, 0x02D5, 0x0000, 0x00A8 },
	{ 0x00C8, 0x02D5, 0x0000, 0x00A9 },
	{ 0x0103, 0x02D5, 0x0000, 0x00AA },
	{ 0x0145, 0x02D5, 0x0000, 0x00AB },
	{ 0x0190, 0x02D5, 0x0000, 0x00AC },
	{ 0x01CB, 0x02D5, 0x0000, 0x00AD },
	{ 0x020D, 0x02D5, 0x0000, 0x00AE },
	{ 0x0258, 0x02D5, 0x0000, 0x00AF },
	{ 0x0293, 0x02D5, 0x0000, 0x00B0 },
	{ 0x02D5, 0x02D5, 0x0000, 0x00B1 },
	{ 0x02D5, 0x0293, 0x0000, 0x00B2 },
	{ 0x02D5, 0x0258, 0x0000, 0x00B3 },
	{ 0x02D5, 0x020D, 0x0000, 0x00B4 },
	{ 0x02D5, 0x01CB, 0x0000, 0x00B5 },
	{ 0x02D5, 0x0190, 0x0000, 0x00B6 },
	{ 0x02D5, 0x0145, 0x0000, 0x00B7 },
	{ 0x02D5, 0x0103, 0x0000, 0x00B8 },
	{ 0x02D5, 0x00C8, 0x0000, 0x00B9 },
	{ 0x02D5, 0x007D, 0x0000, 0x00BA },
	{ 0x02D5, 0x003B, 0x0000, 0x00BB },
	{ 0x01CB, 0x0000, 0x0000, 0x00BC },
	{ 0x01CB, 0x0000, 0x003B, 0x00BD },
	{ 0x01CB, 0x0000, 0x007D, 0x00BE },
	{ 0x01CB, 0x0000, 0x00C8, 0x00BF },
	{ 0x01CB, 0x0000, 0x0103, 0x00C0 },
	{ 0x01CB, 0x0000, 0x0145, 0x00C1 },
	{ 0x01CB, 0x0000, 0x0190, 0x00C2 },
	{ 0x01CB, 0x0000, 0x01CB, 0x00C3 },
	{ 0x0190, 0x0000, 0x01CB, 0x00C4 },
	{ 0x0145, 0x0000, 0x01CB, 0x00C5 },
	{ 0x0103, 0x0000, 0x01CB, 0x00C6 },
	{ 0x00C8, 0x0000, 0x01CB, 0x00C7 },
	{ 0x007D, 0x0000, 0x01CB, 0x00C8 },
	{ 0x003B, 0x0000, 0x01CB, 0x00C9 },
	{ 0x0000, 0x0000, 0x01CB, 0x00CA },
	{ 0x0000, 0x003B, 0x01CB, 0x00CB },
	{ 0x0000, 0x007D, 0x01CB, 0x00CC },
	{ 0x0000, 0x00C8, 0x01CB, 0x00CD },
	{ 0x0000, 0x0103, 0x01CB, 0x00CE },
	{ 0x0000, 0x0145, 0x01CB, 0x00CF },
	{ 0x0000, 0x0190, 0x01CB, 0x00D0 },
	{ 0x0000, 0x01CB, 0x01CB, 0x00D1 },
	{ 0x0000, 0x01CB, 0x0190, 0x00D2 },
	{ 0x0000, 0x01CB, 0x0145, 0x00D3 },
	{ 0x0000, 0x01CB, 0x0103, 0x00D4 },
	{ 0x0000, 0x01CB, 0x00C8, 0x00D5 },
	{ 0x0000, 0x01CB, 0x007D, 0x00D6 },
	{ 0x0000, 0x01CB, 0x003B, 0x00D7 },
	{ 0x0000, 0x01CB, 0x0000, 0x00D8 },
	{ 0x003B, 0x01CB, 0x0000, 0x00D9 },
	{ 0x007D, 0x01CB, 0x0000, 0x00DA },
	{ 0x00C8, 0x01CB, 0x0000, 0x00DB },
	{ 0x0103, 0x01CB, 0x0000, 0x00DC },
	{ 0x0145, 0x01CB, 0x0000, 0x00DD },
	{ 0x0190, 0x01CB, 0x0000, 0x00DE },
	{ 0x01CB, 0x01CB, 0x0000, 0x00DF },
	{ 0x01CB, 0x0190, 0x0000, 0x00E0 },
	{ 0x01CB, 0x0145, 0x0000, 0x00E1 },
	{ 0x01CB, 0x0103, 0x0000, 0x00E2 },
	{ 0x01CB, 0x00C8, 0x0000, 0x00E3 },
	{ 0x01CB, 0x007D, 0x0000, 0x00E4 },
	{ 0x01CB, 0x003B, 0x0000, 0x00E5 },
	{ 0x0103, 0x0000, 0x0000, 0x00E6 },
	{ 0x0103, 0x0000, 0x003B, 0x00E7 },
	{ 0x0103, 0x0000, 0x007D, 0x00E8 },
	{ 0x0103, 0x0000, 0x00C8, 0x00E9 },
	{ 0x0103, 0x0000, 0x0103, 0x00EA },
	{ 0x00C8, 0x0000, 0x0103, 0x00EB },
	{ 0x007D, 0x0000, 0x0103, 0x00EC },
	{ 0x003B, 0x0000, 0x0103, 0x00ED },
	{ 0x0000, 0x0000, 0x0103, 0x00EE },
	{ 0x0000, 0x003B, 0x0103, 0x00EF },
	{ 0x0000, 0x007D, 0x0103, 0x00F0 },
	{ 0x0000, 0x00C8, 0x0103, 0x00F1 },
	{ 0x0000, 0x0103, 0x0103, 0x00F2 },
	{ 0x0000, 0x0103, 0x00C8, 0x00F3 },
	{ 0x0000, 0x0103, 0x007D, 0x00F4 },
	{ 0x0000, 0x0103, 0x003B, 0x00F5 },
	{ 0x0000, 0x0103, 0x0000, 0x00F6 },
	{ 0x003B, 0x0103, 0x0000, 0x00F7 },
	{ 0x007D, 0x0103, 0x0000, 0x00F8 },
	{ 0x00C8, 0x0103, 0x0000, 0x00F9 },
	{ 0x0103, 0x0103, 0x0000, 0x00FA },
	{ 0x0103, 0x00C8, 0x0000, 0x00FB },
	{ 0x0103, 0x007D, 0x0000, 0x00FC },
	{ 0x0103, 0x003B, 0x0000, 0x00FD },
	{ 0x0000, 0x0000, 0x0000, 0x00FE },
	{ 0x0000, 0x0000, 0x0000, 0x0001 }
};
#endif


TEDINFO rs_tedinfo[NUM_TI] = {
	{ cops_rs_string_1, cops_rs_string_2, cops_rs_string_3, SMALL, 6, TE_LEFT, 0x1100, 0x0, -1, 36,1 },
	{ cops_rs_string_5, cops_rs_string_6, cops_rs_string_7, SMALL, 6, TE_LEFT, 0x1100, 0x0, -1, 3,1 }, /* ABOUT_BY */
	{ cops_rs_string_8, cops_rs_string_9, cops_rs_string_10, SMALL, 6, TE_LEFT, 0x1100, 0x0, -1, 35,1 },
	{ cops_rs_string_28, cops_rs_string_29, cops_rs_string_30, IBM, 6, TE_CNTR, 0x1180, 0x0, -2, 21,21 }, /* SET_PATH */
	{ cops_rs_string_35, cops_rs_string_36, cops_rs_string_37, IBM, 6, TE_LEFT, 0x1180, 0x0, -2, 3,13 } /* SET_TERMAFTER */
};


OBJECT rs_object[NUM_OBS] = {
/* ABOUT_DIALOG */

	{ -1, 1, 7, G_BOX, OF_FL3DBAK, OS_OUTLINED, C_UNION(0x21100L), 0,0, 44,7 },
	{ 2, -1, -1, G_STRING, OF_FL3DBAK, 0xFF40, C_UNION(cops_rs_string_0), 1045,768, 20,1 },
	{ 3, -1, -1, G_IMAGE, OF_NONE, OS_NORMAL, C_UNION(&rs_bitblk[0]), 7,1, 28672,8960 },
	{ 4, -1, -1, G_TEXT, OF_NONE, OS_NORMAL, C_UNION(&rs_tedinfo[0]), 2,5, 538,1536 },
	{ 5, -1, -1, G_BUTTON, 0x607, OS_WHITEBAK, C_UNION(cops_rs_string_4), 33,5, 9,257 }, /* ABOUT_OK */
	{ 6, -1, -1, G_TEXT, OF_NONE, OS_NORMAL, C_UNION(&rs_tedinfo[1]), 1,6, 3,1536 }, /* ABOUT_BY */
	{ 7, -1, -1, G_TEXT, OF_NONE, OS_NORMAL, C_UNION(&rs_tedinfo[2]), 4,6, 1049,1536 },
	{ 0, -1, -1, G_CICON, OF_LASTOB, OS_NORMAL, C_UNION(&rs_ciconblk[0]), 2,1, 8192,8192 }, /* COPS_ICON */

/* INFO_DIALOG */

	{ -1, 1, 14, G_BOX, OF_FL3DBAK, OS_OUTLINED, C_UNION(0x21100L), 0,0, 37,17 },
	{ 2, -1, -1, G_STRING, OF_FL3DBAK, 0xFF40, C_UNION(cops_rs_string_12), 2,1, 33,1 }, /* CITITLE */
	{ 3, -1, -1, G_STRING, OF_NONE, OS_NORMAL, C_UNION(cops_rs_string_13), 2,3, 12,1 }, /* INFO_FILENAME */
	{ 4, -1, -1, G_STRING, OF_NONE, OS_NORMAL, C_UNION(cops_rs_string_14), 15,3, 20,1 }, /* CIFILE */
	{ 5, -1, -1, G_STRING, OF_NONE, OS_NORMAL, C_UNION(cops_rs_string_15), 2,4, 12,1 }, /* INFO_VERSION */
	{ 6, -1, -1, G_STRING, OF_NONE, OS_NORMAL, C_UNION(cops_rs_string_16), 15,4, 5,1 }, /* CIVER */
	{ 7, -1, -1, G_STRING, OF_NONE, OS_NORMAL, C_UNION(cops_rs_string_17), 2,5, 12,1 }, /* INFO_ID */
	{ 8, -1, -1, G_STRING, OF_NONE, OS_NORMAL, C_UNION(cops_rs_string_18), 15,5, 4,1 }, /* CIID */
	{ 13, 9, 12, G_BUTTON, OF_FL3DBAK, 0xFE40, C_UNION(cops_rs_string_19), 2,7, 33,7 },
	{ 10, -1, -1, G_BUTTON, 0x401, 0x8040, C_UNION(cops_rs_string_20), 2,2, 30,1 }, /* INFO_RAM */
	{ 11, -1, -1, G_BUTTON, OF_FL3DBAK, 0x8048, C_UNION(cops_rs_string_21), 2,3, 30,1 }, /* INFO_SETONLY */
	{ 12, -1, -1, G_BUTTON, OF_FL3DBAK, 0x8548, C_UNION(cops_rs_string_22), 2,4, 30,1 }, /* INFO_BOOTINIT */
	{ 8, -1, -1, G_BUTTON, 0x401, 0x8540, C_UNION(cops_rs_string_23), 2,5, 30,1 }, /* INFO_AUTOBOOT */
	{ 14, -1, -1, G_BUTTON, 0x607, OS_WHITEBAK, C_UNION(cops_rs_string_24), 15,15, 9,257 }, /* INFO_OK */
	{ 0, -1, -1, G_BUTTON, 0x625, OS_WHITEBAK, C_UNION(cops_rs_string_25), 26,15, 9,257 }, /* INFO_CANCEL */

/* SET_DIALOG */

	{ -1, 1, 10, G_BOX, OF_FL3DBAK, OS_OUTLINED, C_UNION(0x21100L), 0,0, 37,14 },
	{ 2, -1, -1, G_STRING, OF_FL3DBAK, 0xFF40, C_UNION(cops_rs_string_26), 2,1, 33,769 }, /* SET_SETTINGS */
	{ 3, -1, -1, G_BUTTON, 0x605, 0x440, C_UNION(cops_rs_string_27), 2,3, 11,257 }, /* SET_SELPATH */
	{ 4, -1, -1, G_FTEXT, 0x408, OS_NORMAL, C_UNION(&rs_tedinfo[3]), 15,3, 20,1 }, /* SET_PATH */
	{ 5, -1, -1, G_BUTTON, 0x401, 0x8040, C_UNION(cops_rs_string_31), 2,6, 33,1 }, /* SET_ICONIFY */
	{ 6, -1, -1, G_BUTTON, 0x401, 0x8040, C_UNION(cops_rs_string_32), 2,7, 33,1 }, /* SET_DCLICK */
	{ 7, -1, -1, G_BUTTON, 0x401, 0x8040, C_UNION(cops_rs_string_33), 2,8, 33,1 }, /* SET_SORTNAME */
	{ 8, -1, -1, G_BUTTON, 0x401, 0x8040, C_UNION(cops_rs_string_34), 2,10, 18,1 }, /* SET_TERM */
	{ 9, -1, -1, G_FTEXT, 0x408, OS_NORMAL, C_UNION(&rs_tedinfo[4]), 21,10, 14,1 }, /* SET_TERMAFTER */
	{ 10, -1, -1, G_BUTTON, 0x607, OS_WHITEBAK, C_UNION(cops_rs_string_38), 15,12, 9,257 }, /* SET_OK */
	{ 0, -1, -1, G_BUTTON, 0x625, OS_WHITEBAK, C_UNION(cops_rs_string_39), 26,12, 9,257 }, /* SET_CANCEL */

/* ICONIFIED_DIALOG */

	{ -1, 1, 1, G_BOX, OF_NONE, OS_OUTLINED, C_UNION(0x1100L), 0,0, 52,9 }, /* ICFDLG_ROOT */
	{ 0, -1, -1, G_BOX, OF_LASTOB, OS_NORMAL, C_UNION(0x1141L), 0,0, 4,2 }, /* ICFDLG_ICON */

/* EMPTY_TREE */

	{ -1, 1, 1, G_IBOX, OF_NONE, OS_NORMAL, C_UNION(0x1100L), 0,0, 32,11 },
	{ 0, -1, -1, G_IBOX, OF_LASTOB, OS_NORMAL, C_UNION(0x1100L), 0,0, 32,11 },

/* ICON_DIALOG */

	{ -1, 1, 1, G_BOX, OF_NONE, OS_NORMAL, C_UNION(0x21100L), 0,0, 52,9 },
	{ 0, -1, -1, G_IMAGE, OF_LASTOB, OS_NORMAL, C_UNION(&rs_bitblk[1]), 19,2, 8192,6144 } /* INACTIVE_IMG */
};


OBJECT *rs_trindex[NUM_TREE] = {
	&rs_object[0], /* ABOUT_DIALOG */
	&rs_object[8], /* INFO_DIALOG */
	&rs_object[23], /* SET_DIALOG */
	&rs_object[34], /* ICONIFIED_DIALOG */
	&rs_object[36], /* EMPTY_TREE */
	&rs_object[38] /* ICON_DIALOG */
};





#if RSC_STATIC_FILE

#if RSC_NAMED_FUNCTIONS
#ifdef __STDC__
_WORD cops_rs_rsc_load(_WORD wchar, _WORD hchar)
#else
_WORD cops_rs_rsc_load(wchar, hchar)
_WORD wchar;
_WORD wchar;
#endif
{
#ifndef RSC_HAS_PALETTE
#  define RSC_HAS_PALETTE 0
#endif
#ifndef RSC_USE_PALETTE
#  define RSC_USE_PALETTE 0
#endif
#if RSC_HAS_PALETTE || RSC_USE_PALETTE
	W_Cicon_Setpalette(&rgb_palette[0][0]);
#endif
#if NUM_OBS != 0
	{
		_WORD Obj;
		OBJECT *tree;
		for (Obj = 0, tree = rs_object; Obj < NUM_OBS; Obj++, tree++)
		{
			tree->ob_x = wchar * (tree->ob_x & 0xff) + (tree->ob_x >> 8);
			tree->ob_y = hchar * (tree->ob_y & 0xff) + (tree->ob_y >> 8);
			tree->ob_width = wchar * (tree->ob_width & 0xff) + (tree->ob_width >> 8);
			tree->ob_height = hchar * (tree->ob_height & 0xff) + (tree->ob_height >> 8);
		}
		hfix_objs(NULL, rs_object, NUM_OBS);
	}
#endif
	return 1;
}


#ifdef __STDC__
_WORD cops_rs_rsc_gaddr(_WORD type, _WORD idx, void *gaddr)
#else
_WORD cops_rs_rsc_gaddr(type, idx, gaddr)
_WORD type;
_WORD idx;
void *gaddr;
#endif
{
	switch (type)
	{
#if NUM_TREE != 0
	case R_TREE:
		if (idx < 0 || idx >= NUM_TREE)
			return 0;
		*((OBJECT **)gaddr) = rs_trindex[idx];
		break;
#endif
#if NUM_OBS != 0
	case R_OBJECT:
		if (idx < 0 || idx >= NUM_OBS)
			return 0;
		*((OBJECT **)gaddr) = &rs_object[idx];
		break;
#endif
#if NUM_TI != 0
	case R_TEDINFO:
		if (idx < 0 || idx >= NUM_TI)
			return 0;
		*((TEDINFO **)gaddr) = &rs_tedinfo[idx];
		break;
#endif
#if NUM_IB != 0
	case R_ICONBLK:
		if (idx < 0 || idx >= NUM_IB)
			return 0;
		*((ICONBLK **)gaddr) = &rs_iconblk[idx];
		break;
#endif
#if NUM_BB != 0
	case R_BITBLK:
		if (idx < 0 || idx >= NUM_BB)
			return 0;
		*((BITBLK **)gaddr) = &rs_bitblk[idx];
		break;
#endif
#if NUM_FRSTR != 0
	case R_STRING:
		if (idx < 0 || idx >= NUM_FRSTR)
			return 0;
		*((char **)gaddr) = (char *)(rs_frstr[idx]);
		break;
#endif
#if NUM_FRIMG != 0
	case R_IMAGEDATA:
		if (idx < 0 || idx >= NUM_FRIMG)
			return 0;
		*((BITBLK **)gaddr) = rs_frimg[idx];
		break;
#endif
#if NUM_OBS != 0
	case R_OBSPEC:
		if (idx < 0 || idx >= NUM_OBS)
			return 0;
		*((_LONG **)gaddr) = &rs_object[idx].ob_spec.index;
		break;
#endif
#if NUM_TI != 0
	case R_TEPTEXT:
		if (idx < 0 || idx >= NUM_TI)
			return 0;
		*((char ***)gaddr) = (char **)(&rs_tedinfo[idx].te_ptext);
		break;
#endif
#if NUM_TI != 0
	case R_TEPTMPLT:
		if (idx < 0 || idx >= NUM_TI)
			return 0;
		*((char ***)gaddr) = (char **)(&rs_tedinfo[idx].te_ptmplt);
		break;
#endif
#if NUM_TI != 0
	case R_TEPVALID:
		if (idx < 0 || idx >= NUM_TI)
			return 0;
		*((char ***)gaddr) = (char **)(&rs_tedinfo[idx].te_pvalid);
		break;
#endif
#if NUM_IB != 0
	case R_IBPMASK:
		if (idx < 0 || idx >= NUM_IB)
			return 0;
		*((char ***)gaddr) = (char **)(&rs_iconblk[idx].ib_pmask);
		break;
#endif
#if NUM_IB != 0
	case R_IBPDATA:
		if (idx < 0 || idx >= NUM_IB)
			return 0;
		*((char ***)gaddr) = (char **)(&rs_iconblk[idx].ib_pdata);
		break;
#endif
#if NUM_IB != 0
	case R_IBPTEXT:
		if (idx < 0 || idx >= NUM_IB)
			return 0;
		*((char ***)gaddr) = (char **)(&rs_iconblk[idx].ib_ptext);
		break;
#endif
#if NUM_BB != 0
	case R_BIPDATA:
		if (idx < 0 || idx >= NUM_BB)
			return 0;
		*((char ***)gaddr) = (char **)(&rs_bitblk[idx].bi_pdata);
		break;
#endif
#if NUM_FRSTR != 0
	case R_FRSTR:
		if (idx < 0 || idx >= NUM_FRSTR)
			return 0;
		*((char ***)gaddr) = (char **)(&rs_frstr[idx]);
		break;
#endif
#if NUM_FRIMG != 0
	case R_FRIMG:
		if (idx < 0 || idx >= NUM_FRIMG)
			return 0;
		*((BITBLK ***)gaddr) = &rs_frimg[idx];
		break;
#endif
	default:
		return 0;
	}
	return 1;
}


#ifdef __STDC__
_WORD cops_rs_rsc_free(void)
#else
_WORD cops_rs_rsc_free()
#endif
{
#if NUM_OBS != 0
	hrelease_objs(rs_object, NUM_OBS);
#endif
	return 1;
}

#endif /* RSC_NAMED_FUNCTIONS */

#else /* !RSC_STATIC_FILE */
_WORD rs_numstrings = 327;
_WORD rs_numfrstr = 287;

_WORD rs_nuser = 0;
_WORD rs_numimages = 2;
_WORD rs_numbb = 2;
_WORD rs_numfrimg = 0;
_WORD rs_numib = 0;
_WORD rs_numcib = 1;
_WORD rs_numti = 5;
_WORD rs_numobs = 40;
_WORD rs_numtree = 6;

char rs_name[] = "cops_rs.rsc";

_WORD _rsc_format = 2; /* RSC_FORM_SOURCE2 */
#endif /* RSC_STATIC_FILE */
