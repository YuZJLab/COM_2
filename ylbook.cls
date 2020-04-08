%% Copyright (C) 2020 YU Zhejian <Zhejian.19@intl.zju.edu.cn>
%% 
%% This file may be distributed and/or modified under the conditions of
%% the LaTeX Project Public License, either version 1.2 of this license
%% or (at your option) any later version.  The latest version of this
%% license is in:
%% 
%%    http://www.latex-project.org/lppl.txt
%% 
%% and version 1.2 or later is part of all distributions of LaTeX version
%% 1999/12/01 or later.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% PREPARATION
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}[1999/12/01]\ProvidesClass{ylbook}[2020-08-04 v2.1 YLBook]

\RequirePackage{times}
\RequirePackage{url}
\RequirePackage{iftex}

\newif\if@chinese \@chinesefalse
\DeclareOption{chinese}{\@chinesetrue}
\newif\if@web \@webfalse
\DeclareOption{web}{\@webtrue}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions
\LoadClass{book}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% MARGINS	
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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
\setlength\textheight{9in}
\if@twoside
    \setlength\oddsidemargin{-0.5in}
    \setlength\evensidemargin{0.5in}
\else
    \setlength\oddsidemargin{0in}
    \setlength\evensidemargin{0in}
\fi
\setlength\marginparwidth{0pt}
\setlength\marginparsep{0pt}

\setlength\parindent{2em}
\RequirePackage{indentfirst}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% WEB
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\if@web
    \renewcommand\familydefault{\sfdefault}
    \@mainmattertrue\pagenumbering{arabic}
    \renewcommand{\cleardoublepage}{\clearpage}

    \renewcommand\part{%
    \clearpage
	\if@twocolumn
		\onecolumn
	    \@tempswatrue
	\else
		\@tempswafalse
	\fi
    \secdef\@part\@spart}

    \def\@endpart{\if@tempswa\twocolumn\fi\vspace*{30\p@}\par}

    \renewcommand\chapter{\par
    \thispagestyle{plain}%
    \global\@topnum\z@
    \@afterindentfalse
    \secdef\@chapter\@schapter}

\else
    \renewcommand\frontmatter{\@mainmatterfalse\pagenumbering{roman}}
    \renewcommand\mainmatter{\@mainmattertrue\pagenumbering{arabic}}
    \renewcommand\backmatter{\@mainmatterfalse\pagenumbering{roman}}
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% CHINESE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\if@chinese
    \RequirePackage{xeCJK}\RequireXeTeX
    \renewcommand\thepart {第 \@Roman\c@part 部分}
    \renewcommand\thechapter {\@arabic\c@chapter}
    \renewcommand\contentsname{目录}
    \renewcommand\listfigurename{图片目录}
    \renewcommand\listtablename{表格目录}
    \renewcommand\bibname{参考书目}
    \renewcommand\indexname{索引}
    \renewcommand\figurename{图}
    \renewcommand\tablename{表}
    \renewcommand\partname{}
    \renewcommand\chaptername{}
    \renewcommand\appendixname{Appendix}
    
    \def\@chapter[#1]#2{
	\refstepcounter{chapter}%
	\typeout{第 \thechapter 章：}%
	\addcontentsline{toc}{chapter}%
	{\protect\numberline{\thechapter}#1}%
	\chaptermark{#1}%
	\addtocontents{lof}{\protect\addvspace{10\p@}}%
	\addtocontents{lot}{\protect\addvspace{10\p@}}%
	\@makechapterhead{#2}}
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% CHAPTER
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\@makechapterhead#1{%
\vspace*{50\p@}
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
            \fi
            \vspace*{40\p@}
		\fi
}}

\def\@makeschapterhead#1{%
\vspace*{50\p@}%
{\parindent \z@ \raggedright
	\huge\bfseries #1\par\nobreak
    \vspace*{40\p@}
}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% TITLE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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

\endinput
