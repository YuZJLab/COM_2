%% Based on LaTeX standard book class.
%% Copyright (C) 1993-2019
%% The LaTeX3 Project and any individual authors listed elsewhere
%% in this file.
%% --------------------------------------------------------------
%% It may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3c
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%    https://www.latex-project.org/lppl.txt
%% and version 1.3c or later is part of all distributions of LaTeX
%% version 2008 or later.
%% This class file is modified by YuZJ.
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{ylbook}
[2019/10/25 v1.9 Unstandard LaTeX document class, Modified by YuZJ.]
\renewcommand{\cleardoublepage}{\clearpage\if@twoside \ifodd\c@page\else
\hbox{}\thispagestyle{empty}\newpage\if@twocolumn\hbox{}\thispagestyle{empty}\newpage\fi\fi\fi}
\RequirePackage{iftex}
\newif\if@restonecol
\newif\if@chinese \@chinesefalse
\newif\if@titlepage \@titlepagefalse
\newif\if@web \@webfalse
\newif\if@mainmatter
\@twosidetrue  \@mparswitchtrue\@twocolumnfalse
\setlength\paperheight {297mm}%
\setlength\paperwidth  {210mm}
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\DeclareOption{final}{\setlength\overfullrule{0pt}}
\DeclareOption{chinese}{\@chinesetrue }
\DeclareOption{web}{\@webtrue\@twosidefalse
\renewcommand\familydefault{\sfdefault}}
\DeclareOption{titlepage}{\@titlepagetrue}
\ProcessOptions

\renewcommand\normalsize{%
	\@setfontsize\normalsize\@xpt\@xiipt
	\abovedisplayskip 10\p@ \@plus2\p@ \@minus5\p@
	\abovedisplayshortskip \z@ \@plus3\p@
	\belowdisplayshortskip 6\p@ \@plus3\p@ \@minus3\p@
	\belowdisplayskip \abovedisplayskip
	\let\@listi\@listI}
\normalsize
\if@chinese\RequirePackage{xeCJK}\RequireXeTeX\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Set Font Size
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ifx\MakeRobust\@undefined \else
	\MakeRobust\normalsize
\fi
\DeclareRobustCommand\small{%
	\@setfontsize\small\@viipt\@viiipt%
	\abovedisplayskip 8.5\p@ \@plus3\p@ \@minus4\p@
	\abovedisplayshortskip \z@ \@plus2\p@
	\belowdisplayshortskip 4\p@ \@plus2\p@ \@minus2\p@
	\def\@listi{\leftmargin\leftmargini
		\topsep 4\p@ \@plus2\p@ \@minus2\p@
		\parsep 2\p@ \@plus\p@ \@minus\p@
		\itemsep \parsep}%
	\belowdisplayskip \abovedisplayskip
}
\DeclareRobustCommand\footnotesize{%
	\@setfontsize\footnotesize\@viipt\@viiipt%
	\abovedisplayskip 6\p@ \@plus2\p@ \@minus4\p@
	\abovedisplayshortskip \z@ \@plus\p@
	\belowdisplayshortskip 3\p@ \@plus\p@ \@minus2\p@
	\def\@listi{\leftmargin\leftmargini
		\topsep 3\p@ \@plus\p@ \@minus\p@
		\parsep 2\p@ \@plus\p@ \@minus\p@
		\itemsep \parsep}%
	\belowdisplayskip \abovedisplayskip
}
\DeclareRobustCommand\tiny{\@setfontsize\tiny\@vpt\@vipt}
\DeclareRobustCommand\large{\@setfontsize\large\@xiipt{14}}
\DeclareRobustCommand\Large{\@setfontsize\Large\@xivpt{18}}
\DeclareRobustCommand\LARGE{\@setfontsize\LARGE\@xviipt{22}}
\DeclareRobustCommand\huge{\@setfontsize\huge\@xxpt{25}}
\DeclareRobustCommand\Huge{\@setfontsize\Huge\@xxvpt{30}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Set Margin
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\setlength\parindent{2em}
\setlength\smallskipamount{3\p@ \@plus 1\p@ \@minus 1\p@}
\setlength\medskipamount{6\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\bigskipamount{12\p@ \@plus 4\p@ \@minus 4\p@}
\setlength\headheight{1ex}
\setlength\headsep{3ex}
\setlength\topskip{0ex}
\setlength\footskip{.35in}
\setlength\maxdepth{4\p@}
\setlength\textwidth{6.2in}
\setlength\textheight{9.5in}
\addtolength\textheight{\topskip}
\if@twoside
\setlength\oddsidemargin{-0.5in}
\setlength\evensidemargin{0.5in}
\else
\setlength\oddsidemargin{0in}
\setlength\evensidemargin{0in}
\fi
\setlength\marginparwidth{0pt}
\setlength\marginparsep{0pt}
\setlength\topmargin{0in}
\setlength\footnotesep{6.65\p@}
\setlength{\skip\footins}{9\p@ \@plus 4\p@ \@minus 2\p@}
\setlength\floatsep{12\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\textfloatsep{20\p@ \@plus 2\p@ \@minus 4\p@}
\setlength\intextsep{12\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\dblfloatsep{12\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\dbltextfloatsep{20\p@ \@plus 2\p@ \@minus 4\p@}
\setlength\@fptop{0\p@ \@plus 1fil}
\setlength\@fpsep{8\p@ \@plus 2fil}
\setlength\@fpbot{0\p@ \@plus 1fil}
\setlength\@dblfptop{0\p@ \@plus 1fil}
\setlength\@dblfpsep{8\p@ \@plus 2fil}
\setlength\@dblfpbot{0\p@ \@plus 1fil}
\setlength\partopsep{2\p@ \@plus 1\p@ \@minus 1\p@}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Set List Items
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\@listi{\leftmargin\leftmargini
	\parsep 4\p@ \@plus2\p@ \@minus\p@
	\topsep 8\p@ \@plus2\p@ \@minus4\p@
	\itemsep4\p@ \@plus2\p@ \@minus\p@}
\let\@listI\@listi
\@listi
\def\@listii {\leftmargin\leftmarginii
	\labelwidth\leftmarginii
	\advance\labelwidth-\labelsep
	\topsep    4\p@ \@plus2\p@ \@minus\p@
	\parsep    2\p@ \@plus\p@  \@minus\p@
	\itemsep   \parsep}
\def\@listiii{\leftmargin\leftmarginiii
	\labelwidth\leftmarginiii
	\advance\labelwidth-\labelsep
	\topsep    2\p@ \@plus\p@\@minus\p@
	\parsep    \z@
	\partopsep \p@ \@plus\z@ \@minus\p@
	\itemsep   \topsep}
\def\@listiv {\leftmargin\leftmarginiv
	\labelwidth\leftmarginiv
	\advance\labelwidth-\labelsep}
\def\@listv  {\leftmargin\leftmarginv
	\labelwidth\leftmarginv
	\advance\labelwidth-\labelsep}
\def\@listvi {\leftmargin\leftmarginvi
	\labelwidth\leftmarginvi
	\advance\labelwidth-\labelsep}
\setlength\lineskip{0.5ex}
\setlength\normallineskip{0.5ex}
\renewcommand\baselinestretch{}
\setlength\parskip{1ex}
\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301
\setcounter{topnumber}{2}
\renewcommand\topfraction{.7}
\setcounter{bottomnumber}{1}
\renewcommand\bottomfraction{.3}
\setcounter{totalnumber}{3}
\renewcommand\textfraction{.2}
\renewcommand\floatpagefraction{.5}
\setcounter{dbltopnumber}{2}
\renewcommand\dbltopfraction{.7}
\renewcommand\dblfloatpagefraction{.5}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Set Chapter Names
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\if@twoside
	\def\ps@headings{%
	\let\@oddfoot\@empty\let\@evenfoot\@empty
	\def\@evenhead{\thepage\hfil\slshape\leftmark}%
	\def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
	\let\@mkboth\markboth
	\def\chaptermark##1{%
	\markboth {\MakeUppercase{%
			\ifnum \c@secnumdepth >\m@ne
				\if@web
					\if@chinese
						第\space \thechapter 章\space %
					\else
						Chapter\space \thechapter. \space %
					\fi
				\else
					\if@mainmatter
						\if@chinese
							第\space \thechapter 章\space %
						\else
							Chapter\space \thechapter. \space %
						\fi
					\fi
				\fi
			\fi
			##1}}{}}%
	\def\sectionmark##1{%
	\markright {\MakeUppercase{%
			\ifnum \c@secnumdepth >\z@
				\thesection. \ %
			\fi
			##1}}}}
\else
	\def\ps@headings{%
	\let\@oddfoot\@empty
	\def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
	\let\@mkboth\markboth
	\def\chaptermark##1{%
	\markright {\MakeUppercase{%
			\ifnum \c@secnumdepth >\m@ne
			\if@web
			\if@chinese
				第\space \thechapter 章\space %
			\else
				Chapter\space \thechapter. \space %
			\fi
		\else
			\if@mainmatter
				\if@chinese
					第\space \thechapter 章\space %
				\else
					Chapter\space \thechapter. \space %
				\fi
			\fi
		\fi
			\fi
			##1}}}}
\fi
\def\ps@myheadings{%
	\let\@oddfoot\@empty\let\@evenfoot\@empty
	\def\@evenhead{\thepage\hfil\slshape\leftmark}%
	\def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
	\let\@mkboth\@gobbletwo
	\let\chaptermark\@gobble
	\let\sectionmark\@gobble
}
\newcommand*\chaptermark[1]{}
\setcounter{secnumdepth}{5}
\newcounter {part}
\newcounter {chapter}
\newcounter {section}[chapter]
\newcounter {subsection}[section]
\newcounter {subsubsection}[subsection]
\newcounter {paragraph}[subsubsection]
\newcounter {subparagraph}[paragraph]
\renewcommand\thepart {\@Roman\c@part}
\renewcommand\thechapter {\@arabic\c@chapter}
\renewcommand\thesection {\thechapter.\@arabic\c@section}
\renewcommand\thesubsection{\thesection.\@arabic\c@subsection}
\renewcommand\thesubsubsection{\thesubsection.\@arabic\c@subsubsection}
\renewcommand\theparagraph{\thesubsubsection.\@arabic\c@paragraph}
\renewcommand\thesubparagraph{\theparagraph.\@arabic\c@subparagraph}
\if@web
\@mainmattertrue
\else
\newcommand\frontmatter{%
	\@mainmatterfalse
\pagenumbering{roman}}
\newcommand\mainmatter{%
	\@mainmattertrue
	\pagenumbering{arabic}}
\newcommand\backmatter{%
	\@mainmatterfalse
\pagenumbering{roman}}
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Set Part
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand\part{%
	\if@web
	\par
	\else
		\cleardoublepage
		\thispagestyle{empty}%
	\fi
		\if@twocolumn
			\onecolumn
			\@tempswatrue
		\else
			\@tempswafalse
		\fi
	\secdef\@part\@spart}

\def\@part[#1]#2{%
	\ifnum \c@secnumdepth >-2\relax
		\refstepcounter{part}%
		\addcontentsline{toc}{part}{\thepart\hspace{1em}#1}%
	\else
		\addcontentsline{toc}{part}{#1}%
	\fi%
	{\if@web
			\normalfont
			\begin{center}
			\ifnum \c@secnumdepth >-2\relax
				\if@chinese
					\Huge\bfseries 第 \thepart 部分: #2
				\else
					\Huge\bfseries PART \nobreakspace\thepart\space #2
				\fi
			\fi
			\end{center}
		\else
		\vspace*{5cm}
			\centering
			\interlinepenalty \@M
			\normalfont
			\ifnum \c@secnumdepth >-2\relax
				\if@chinese
					\huge\bfseries 第 \thepart 部分
				\else
					\huge\bfseries PART \nobreakspace\thepart
				\fi
				\par
				\vskip 20\p@
				\Huge \bfseries #2\par
			\fi
		\fi
	}%
	\@endpart}
\def\@spart#1{%
	{\centering
			\interlinepenalty \@M
			\normalfont
			\Huge \bfseries #1\par}%
	\@endpart}
\def\@endpart{%\vfil
	\if@web	\else \cleardoublepage \fi
	\if@tempswa
		\twocolumn
	\fi}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Chapter
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand\chapter{\par
  \global\@topnum\z@
  \@afterindentfalse
  \secdef\@chapter\@schapter
  }
\def\@chapter[#1]#2{
	\refstepcounter{chapter}%
	\if@chinese
	\typeout{第 \thechapter 章：}%
	\else
	\typeout{Chapter \space\thechapter .}%
	\fi
	\addcontentsline{toc}{chapter}%
	{\protect\numberline{\thechapter}#1}%
	\chaptermark{#1}%
	\addtocontents{lof}{\protect\addvspace{10\p@}}%
	\addtocontents{lot}{\protect\addvspace{10\p@}}%
	\@makechapterhead{#2}%
	\@afterheading
	}
\def\@makechapterhead#1{%
\if@web\else\vspace*{50\p@}\fi
	{\parindent \z@ \raggedright \normalfont
		\ifnum \c@secnumdepth >\m@ne
			\if@web
				\if@chinese
					\huge\bfseries 第 \thechapter 章：\space
				\else
					\huge\bfseries Chapter \thechapter .\space
				\fi
				#1\par\nobreak
			\else
				\if@chinese
					\huge\bfseries 第 \thechapter 章：\par
				\else
					\huge\bfseries Chapter \thechapter .\par
				\fi
				\Huge\bfseries #1\par\nobreak
				\vspace*{40\p@}
			\fi
		\fi
	}}
\def\@schapter#1{\if@twocolumn
		\@topnewpage[\@makeschapterhead{#1}]%
	\else
		\@makeschapterhead{#1}%
		\@afterheading
	\fi}
\def\@makeschapterhead#1{%
	\vspace*{50\p@}%
	{\parindent \z@ \raggedright
		\normalfont
		\interlinepenalty\@M
		\Huge \bfseries  #1\par\nobreak
		\vskip 40\p@
	}}
\newcommand\section{\@startsection{section}{1}{\z@}{0ex}{0ex}{}}
\newcommand\subsection{\@startsection{subsection}{2}{\z@}{0ex}{0ex}{}}
\newcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}{0ex}{0ex}{}}
\newcommand\paragraph{\@startsection{paragraph}{4}{\z@}{3.25ex \@plus1ex \@minus.2ex}{-1em}{\normalfont\normalsize\bfseries\sffamily}}
\newcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}{3.25ex \@plus1ex \@minus .2ex}{-1em}{\normalfont\normalsize\bfseries\sffamily}}
\if@twocolumn
	\setlength\leftmargini  {2em}
\else
	\setlength\leftmargini  {2.5em}
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Setr Lable Item
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\leftmargin  \leftmargini
\setlength\leftmarginii  {2.2em}
\setlength\leftmarginiii {1.87em}
\setlength\leftmarginiv  {1.7em}
\if@twocolumn
	\setlength\leftmarginv  {.5em}
	\setlength\leftmarginvi {.5em}
\else
	\setlength\leftmarginv  {1em}
	\setlength\leftmarginvi {1em}
\fi
\setlength  \labelsep  {.5em}
\setlength  \labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}
\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty
\renewcommand\theenumi{\@arabic\c@enumi}
\renewcommand\theenumii{\@alph\c@enumii}
\renewcommand\theenumiii{\@roman\c@enumiii}
\renewcommand\theenumiv{\@Alph\c@enumiv}
\newcommand\labelenumi{\theenumi.}
\newcommand\labelenumii{(\theenumii)}
\newcommand\labelenumiii{\theenumiii.}
\newcommand\labelenumiv{\theenumiv.}
\renewcommand\p@enumii{\theenumi}
\renewcommand\p@enumiii{\theenumi(\theenumii)}
\renewcommand\p@enumiv{\p@enumiii\theenumiii}
\newcommand\labelitemi{\textbullet}
\newcommand\labelitemii{\normalfont\bfseries \textendash}
\newcommand\labelitemiii{\textasteriskcentered}
\newcommand\labelitemiv{\textperiodcentered}
\newenvironment{description}
{\list{}{\labelwidth\z@ \itemindent-\leftmargin
		\let\makelabel\descriptionlabel}}
{\endlist}
\newcommand*\descriptionlabel[1]{\hspace\labelsep
	\normalfont\bfseries #1}
\newenvironment{verse}
{\let\\\@centercr
	\list{}{\itemsep      \z@
		\itemindent   -1.5em%
		\listparindent\itemindent
		\rightmargin  \leftmargin
		\advance\leftmargin 1.5em}%
	\item\relax}
{\endlist}
\newenvironment{quotation}
{\list{}{\listparindent 1.5em%
		\itemindent    \listparindent
		\rightmargin   \leftmargin
		\parsep        \z@ \@plus\p@}%
	\item\relax}
{\endlist}
\newenvironment{quote}
{\list{}{\rightmargin\leftmargin}%
	\item\relax}
{\endlist}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Set Title Page
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newenvironment{titlepage}
{%
\if@web\thispagestyle{headings}\else\thispagestyle{empty}\fi
	\if@chinese
		\addcontentsline{toc}{chapter}{封面}
		\markboth{封面}{封面}
	\else
		\addcontentsline{toc}{chapter}{Titlepage}
		\markboth{TITLEPAGE}{TITLEPAGE}
	\fi
	\if@twocolumn
		\@restonecoltrue\onecolumn
	\else
		\@restonecolfalse
	\fi
	\if@web\setcounter{page}{1}\else\setcounter{page}{0}\fi}
{\if@restonecol\twocolumn \fi
	\if@web
		\par
	\else
		\newpage
		\if@chinese
			因排版需要,这一页被空置。
		\else
			\ttfamily This page is intentionally left blank.
		\fi
		\newpage
	\fi
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Set Appendix
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand\appendix{\par
	\setlength\lineskip{0.2ex}
	\setlength\parskip{0.5ex}
	\setcounter{chapter}{0}%
	\setcounter{section}{0}%
	\if@chinese\part{附录}\else\part{Appendix}\fi
	\global\let\appendix\relax
	\global\let\part\relax}
\setlength\arraycolsep{5\p@}
\setlength\tabcolsep{6\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}
\skip\@mpfootins = \skip\footins
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}
\@addtoreset {equation}{chapter}
\renewcommand\theequation
{\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@equation}
\newcounter{figure}[chapter]
\renewcommand \thefigure
{\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@figure}
\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\if@chinese
	\def\fnum@figure{图像\nobreakspace\thefigure}
\else
	\def\fnum@figure{Figure \nobreakspace\thefigure}
\fi
\newenvironment{figure}
{\@float{figure}}
{\end@float}
\newenvironment{figure*}
{\@dblfloat{figure}}
{\end@dblfloat}
\newcounter{table}[chapter]
\renewcommand \thetable
{\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@table}
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename\nobreakspace\thetable}
\newenvironment{table}
{\@float{table}}
{\end@float}
\newenvironment{table*}
{\@dblfloat{table}}
{\end@dblfloat}
\newlength\abovecaptionskip
\newlength\belowcaptionskip
\setlength\abovecaptionskip{10\p@}
\setlength\belowcaptionskip{0\p@}
\long\def\@makecaption#1#2{%
	\vskip\abovecaptionskip
	\sbox\@tempboxa{#1: #2}%
	\ifdim \wd\@tempboxa >\hsize
		#1: #2\par
	\else
		\global \@minipagefalse
		\hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
	\fi
	\vskip\belowcaptionskip}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Set Font
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*\cal{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*\mit{\@fontswitch\relax\mathnormal}
\newcommand\@pnumwidth{1.55em}
\newcommand\@tocrmarg{2.55em}
\newcommand\@dotsep{4.5}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Set Toc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\setcounter{tocdepth}{5}
\newcommand\tableofcontents{%
	\setcounter{chapter}{-1}
	\if@chinese
		\chapter{目录}%
	\else
		\chapter{Table of Contents}
	\fi
	\@starttoc{toc}%
}
\newcommand*\l@part[2]{%
	\ifnum \c@tocdepth >-2\relax
		\addpenalty{-\@highpenalty}%
		\addvspace{2.25em \@plus\p@}%
		\setlength\@tempdima{3em}%
		\begingroup
		\parindent \z@ \rightskip \@pnumwidth
		\parfillskip -\@pnumwidth
		{\leavevmode
			\large \bfseries #1\hfil
			\hb@xt@\@pnumwidth{\hss #2%
				\kern-\p@\kern\p@}}\par
		\nobreak
		\global\@nobreaktrue
		\everypar{\global\@nobreakfalse\everypar{}}%
		\endgroup
	\fi}
\newcommand*\l@chapter[2]{%
	\ifnum \c@tocdepth >\m@ne
		\addpenalty{-\@highpenalty}%
		\begingroup
		\parindent \z@ \rightskip \@pnumwidth
		\parfillskip -\@pnumwidth
		\leavevmode \bfseries
		\advance\leftskip\@tempdima
		\hskip -\leftskip
		#1\nobreak\hfil
		\nobreak\hb@xt@\@pnumwidth{\hss #2%
			\kern-\p@\kern\p@}\par
		\penalty\@highpenalty
		\endgroup
	\fi}
\newcommand*\l@section{\@dottedtocline{1}{1.5em}{2.3em}}
\newcommand*\l@subsection{\@dottedtocline{2}{3.8em}{3.2em}}
\newcommand*\l@subsubsection{\@dottedtocline{3}{7.0em}{4.1em}}
\newcommand*\l@paragraph{\@dottedtocline{4}{10em}{5em}}
\newcommand*\l@subparagraph{\@dottedtocline{5}{12em}{6em}}
\newcommand\listoffigures{%
	\chapter{\listfigurename}%
	\@mkboth{\MakeUppercase\listfigurename}%
	{\MakeUppercase\listfigurename}%
	\@starttoc{lof}%
}
\newcommand*\l@figure{\@dottedtocline{1}{1.5em}{2.3em}}
\newcommand\listoftables{%
	\if@twocolumn
		\@restonecoltrue\onecolumn
	\else
		\@restonecolfalse
	\fi
	\chapter{\listtablename}%
	\@mkboth{\MakeUppercase\listtablename}%
	{\MakeUppercase\listtablename}%
	\@starttoc{lot}%
	\if@restonecol\twocolumn\fi
}
\let\l@table\l@figure
\newdimen\bibindent
\setlength\bibindent{1.5em}
\newenvironment{thebibliography}[1]
{\clearpage
	\if@chinese \chapter{参考文献}\else\chapter{Bibliography}\fi
	\list{\@biblabel{\@arabic\c@enumiv}}%
	{\settowidth\labelwidth{\@biblabel{#1}}%
		\leftmargin\labelwidth
		\advance\leftmargin\labelsep
		\@openbib@code
		\usecounter{enumiv}%
		\let\p@enumiv\@empty
		\renewcommand\theenumiv{\@arabic\c@enumiv}}%
	\sloppy
	\clubpenalty4000
	\@clubpenalty \clubpenalty
	\widowpenalty4000%
	\sfcode`\.\@m}
{\def\@noitemerr
	{\@latex@warning{Blank Bibliography}}%
	\endlist}
\newcommand\newblock{\hskip .11em\@plus.33em\@minus.07em}
\let\@openbib@code\@empty
\newenvironment{theindex}
{\if@twocolumn
		\@restonecolfalse
	\else
		\@restonecoltrue
	\fi
	\twocolumn[\@makeschapterhead{\indexname}]%
	\@mkboth{\MakeUppercase\indexname}%
	{\MakeUppercase\indexname}%
	\thispagestyle{headings}\parindent\z@
	\parskip\z@ \@plus .3\p@\relax
	\columnseprule \z@
	\columnsep 35\p@
	\let\item\@idxitem}
{\if@restonecol\onecolumn\else\clearpage\fi}
\newcommand\@idxitem{\par\hangindent 40\p@}
\newcommand\subitem{\@idxitem \hspace*{20\p@}}
\newcommand\subsubitem{\@idxitem \hspace*{30\p@}}
\newcommand\indexspace{\par \vskip 10\p@ \@plus5\p@ \@minus3\p@\relax}
\renewcommand\footnoterule{%
	\kern-3\p@
	\hrule\@width.4\columnwidth
	\kern2.6\p@}
\@addtoreset{footnote}{chapter}
\newcommand\@makefntext[1]{%
\parindent 1em%
\noindent
\hb@xt@1.8em{\hss\@makefnmark}#1}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Set Names
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\if@chinese
	\newcommand\listfigurename{图像列表}
	\newcommand\listtablename{表格列表}
	\newcommand\indexname{索引}
	\newcommand\tablename{表格}
	\def\today{\number\year 年 \ifcase\month\or
			一月\or 二月\or 三月\or 四月\or 五月\or 六月\or
			七月\or 八月\or 九月\or 十月\or 十一月\or 十二月\fi
		\number\day 日}
\else
	\newcommand\listfigurename{List of Figures}
	\newcommand\listtablename{List of Tables}
	\newcommand\indexname{Index}
	\newcommand\tablename{Table}
	\def\today{\number\year,  \ifcase\month\or
			Jan.\or Feb.\or Mar.\or Apr.\or May\or June\or
			July\or Aug.\or Sept.\or Oct.\or Nov.\or Dec.\fi\ the
		\number\day th}
\fi
\setlength\columnsep{10\p@}
\setlength\columnseprule{0\p@}
\pagestyle{headings}
\pagenumbering{arabic}
\if@twoside
\else
	\raggedbottom
\fi
\if@twocolumn
	\twocolumn
	\sloppy
	\flushbottom
\else
	\onecolumn
\fi
\renewcommand{\verbatim@font}{\color{blue}\ttfamily}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Set Titles
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\RequirePackage{titlesec}
\if@chinese
	\titleformat{\section}[frame]{\LARGE}{\small 第 \thesection 节}{0pt}{}
	\titleformat{\subsection}[frame]{\large}{\small  第\thesubsection 小节}{0pt}{}
	\titleformat{\subsubsection}[frame]{}{\small 第\thesubsubsection 小小节}{0pt}{}
\else
	\titleformat{\section}[frame]{\bf\sf\LARGE}{\small Section \thesection}{0pt}{}
	\titleformat{\subsection}[frame]{\bf\sf\large}{\small SubSection \thesubsection}{0pt}{}
	\titleformat{\subsubsection}[frame]{\bf\sf}{\small SubSubSection \thesubsubsection}{0pt}{}
\fi
\if@titlepage
	\RequirePackage{fancybox,color}
	\shadowsize=2pt
	\newcommand{\@intro}{}
	\newcommand{\intro}[1]{\renewcommand{\@intro}{#1}}
	\newcommand{\@subtitle}{}
	\newcommand{\subtitle}[1]{\renewcommand{\@subtitle}{#1}}
	\newcommand\maketitle{
		\begin{titlepage}
			\sffamily
			\if@web
			\else\vspace*{10mm}\fi
			\begin{center}
				\bfseries\doublebox{\parbox{14cm}{\centering
						\Ovalbox{\centering\parbox{13.7cm}{\centering\Huge \@title\large\\\vspace*{1mm}\@subtitle }}\\\vspace*{5mm}\large \@author \\\vspace*{5mm}\if@chinese 编译于： \else Compiled at:\fi \today}}
			\end{center}
			\vspace*{10mm}
			\shadowbox{\parbox{8cm}{\@intro}}
		\end{titlepage}
		\setcounter{footnote}{0}%
		\vspace*{20mm}
		\global\let\maketitle\relax
		\global\let\intro\relax
		\global\let\@intro\relax
		\global\let\subtitle\relax
		\global\let\@subtitle\relax
	}
\fi
\endinput