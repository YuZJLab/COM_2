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

\NeedsTeXFormat{LaTeX2e}[1999/12/01]\ProvidesClass{ylbook}[2020-08-04 v2.3 YLBook]

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
\RequirePackage{indentfirst}
\if@web
	\RequirePackage[inner=1in,outer=1in]{geometry}
\else
	\RequirePackage[inner=1.5in,outer=0.5in]{geometry}
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% WEB
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\@mainmattertrue
\if@web
    \renewcommand\familydefault{\sfdefault}
	\pagenumbering{arabic}
	\renewcommand{\cleardoublepage}{\relax}
	\renewcommand\frontmatter{\relax}
    \renewcommand\mainmatter{\relax}
	\renewcommand\backmatter{\relax}
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
	\renewcommand\appendixname{附录}

	\def\today{\number\year 年 \ifcase\month\or
	一月\or 二月\or 三月\or 四月\or 五月\or 六月\or
	七月\or 八月\or 九月\or 十月\or 十一月\or 十二月\fi
	\number\day 日}
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% CHAPTER
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\if@web
	\renewcommand\chapter{\par
	\global\@topnum\z@
	\@afterindentfalse
	\secdef\@chapter\@schapter}
\fi
\if@chinese
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
%% PART
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\if@web
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
\else
	\def\@endpart{\vfil\newpage
	\if@twoside\if@openright\null\thispagestyle{empty}\newpage\fi\fi
	\if@tempswa\twocolumn\fi}
\fi


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% SECTIONING
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% TITLE PAGE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{fancybox,color,eso-pic}
	\shadowsize=2pt
	\newcommand{\intro}[1]{\def\@intro{#1}}
	\newcommand{\subtitle}[1]{\def\@subtitle{#1}}
	\newcommand{\backpic}[1]{\def\@backpic{#1}}
	\renewcommand\maketitle{
		\begin{titlepage}
			\ifx\@backpic\@empty\else\AddToShipoutPictureBG*{\includegraphics[width=\paperwidth ,height=\paperheight]{\@backpic}}\fi
			\sffamily
			\if@web\else\vspace*{10mm}\fi
			\begin{center}
				\bfseries\doublebox{\parbox{14cm}{\centering
						\Ovalbox{\centering\parbox{13.7cm}{\centering\Huge \@title\large\\\vspace*{1mm}\@subtitle }}\\\vspace*{5mm}\large \@author \\\vspace*{5mm}\if@chinese 编译于 \else Compiled at\fi \today}}
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

\endinput
