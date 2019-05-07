% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% Template class for producing documents for the Baustatik lecture at ETH Zurich.				  	%									  %
% Copyright 2013, Stefano Marelli and Bruno Sudret, all rights reserved. 						  %
% Please contact Stefano Marelli (marelli@ibk.baug.ethz.ch) for any template-related enquiries.	  %
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{bskdocs}[2017/08/17 bskdocs]

% Article options (we are based on it)
\DeclareOption{12pt}{
	\PassOptionsToClass{\CurrentOption}{article}
}

%% Fallback
\DeclareOption*{
	\ClassWarning{myclass}{Unknown option '\CurrentOption'}
}

%% Execute default options
\ExecuteOptions{12pt}

%% Process given options
\ProcessOptions\relax

%% Load base class (paper in a4 format)
\LoadClass[a4paper]{article}


% load the commonly used notations from the bstnotations package
\RequirePackage{bstnotations}

% Page layout: geometry and margins
%PAGE LAYOUT  --------------------------------------------------------
\setlength{\parindent}{0pt}
\setlength{\parskip}{8.5pt plus 2pt minus 1 pt}

\setlength{\textwidth}{16cm}
\setlength{\textheight}{24cm}
\addtolength{\topmargin}{-1cm}
\addtolength{\headheight}{10pt}
\setlength{\oddsidemargin}{0mm}
\setlength{\evensidemargin}{0cm}
\addtolength{\topmargin}{-10mm}
\renewcommand{\baselinestretch}{1.2}
\renewcommand{\textfraction}{0.1}
\renewcommand{\topfraction}{0.9}
\renewcommand{\bottomfraction}{0.9}
\renewcommand{\floatpagefraction}{0.75}
\setcounter{topnumber}{10}
\setcounter{totalnumber}{10}

% Images: need the graphicx package to create the template layout
\RequirePackage{graphicx}
\graphicspath{{./Figures/}}

% For subfigures
\RequirePackage{subcaption}

% Float placement
\RequirePackage{float}

% For math environments
\RequirePackage{amsmath,amssymb}


% For conditional logic during typesetting (solution/question etc.)
\RequirePackage{ifthen}

% For changing layout in the middle of the document
\RequirePackage{changepage}

% hyperlinks: let's set them to default colors
\RequirePackage[colorlinks=true, urlcolor=black]{hyperref}

%for drawing some things
\RequirePackage{tikz}

% some geometry aesthetics for the boxes around text (used, e.g. around the titlepage)
\setlength{\fboxsep}{0pt}


% Font and language setup
\RequirePackage[latin1]{inputenc} % this is needed for umlauts
\RequirePackage[ngerman]{babel} % this is needed for umlauts

%Sans Serif
\renewcommand{\familydefault}{\sfdefault}

% Bibliography: use the natbib style
\RequirePackage{natbib}

%create switch for undefined commands
\newcommand{\switchMACRO}[3]{
	\ifthenelse{\isundefined{#1}}{
		#3
	}{
		#2
	}
}

%Baustatik abbreviations
\newcommand{\rt}[1]{{\mathrm{#1}}}

%Boxed expressions with wider margins
\newcommand\boxedB[1]{{\setlength\fboxsep{5pt}\boxed{#1}}}

%encircled characters
\newcommand\encircle[1]{%
	\tikz[baseline=(X.base)]
	\node (X) [draw, shape=circle, inner sep= -0.8mm, line width=0.1mm] {\strut {\fontfamily{sfdefault}\selectfont #1} };}

%tabitem
\newcommand{\tabitem}{~~\llap{\textbullet}~~}

%%  Header and Footer Setup--------------------------------------------------------
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\renewcommand{\footrulewidth}{0.4pt}%
\fancyhf{}
%	\fancyhead[LO]{\bf  \small{\nouppercase{\rightmark}}}
%	\fancyhead[RE]{\bf \small \nouppercase{\leftmark}}
%	\fancyhead[LE,RO] {\thepage}
%	%\fancyfoot[LE,RO] {\tiny \TheDate}
\fancyhead[R]{\small   \DOCTYPE \switchMACRO{\DOCNUMBER}{\#\DOCNUMBER}{}}
\fancyhead[L]{\small  Baustatik I}
\fancyfoot[R]{\footnotesize Seite: \thepage/\pageref{end}}
\fancyfoot[L]{\footnotesize \SEMESTER}
\fancyfoot[C]{\footnotesize Chair of Risk, Safety and Uncertainty Quantification}


% Definition of environment exercise
\newcounter{numexo}
\setcounter{numexo}{0}

\newenvironment{exercise}[1]
{\stepcounter{numexo} {\bf Aufgabe~\thenumexo.} {\em {#1}} \\ }
{\vspace{2em}}

\newenvironment{exerciseNoNum}[1]
{\stepcounter{numexo} {\bf Aufgabe.} {\em {#1}} \\ }
{\vspace{2em}}

% Definition of environment solution
\newenvironment{loesung}
{ \small \setlength{\textwidth} {12cm}\hspace*{5mm}{\bf \small L\"osungsweg}\em \begin{adjustwidth}{2em}{0em}}
	{ \hfill $\diamond$ \end{adjustwidth}}

% Definition of environment results
\newenvironment{result}
{ \small \setlength{\textwidth} {12cm}\hspace*{5mm}{\bf \small Resultat}\em \begin{adjustwidth}{2em}{0em}}
	{ \hfill $\diamond$ \end{adjustwidth}}
	
\newenvironment{altLoesung}
{ \small \setlength{\textwidth} {12cm}\hspace*{5mm}{\bf \small Alternativer L\"osungsweg}\em \begin{adjustwidth}{2em}{0em}}
	{ \hfill $\diamond$ \end{adjustwidth}}



% make the numbering lowercase Roman and starting from page 1 at the abstract
\setcounter{page}{1}
\pagenumbering{arabic}

%----------------------------------------------------------------------
% set start of document with logo etc.
%\switchMACRO{\NOTITLE}{
\AtBeginDocument{
\thispagestyle{empty}

\hfill
%\includegraphics[width=6cm]{RSUQ-logo.jpg}\\

\begin{minipage}[c]{0.4\linewidth}
	\includegraphics[width=6cm]{eth_logo_black.jpg}
\end{minipage}
\begin{minipage}[c]{0.6\linewidth}
	\begin{flushright} \small
		Prof. Dr. Bruno Sudret\\[-0.3em]
		Institut f\"ur Baustatik und Konstruktion\\[-0.3em]
		D-BAUG - \SEMESTER
	\end{flushright}
\end{minipage}

\vspace*{15mm}

\begin{center}
	\LARGE \textsf{BAUSTATIK I} \,\textemdash\,  \DOCTYPE \switchMACRO{\DOCNUMBER}{\#\DOCNUMBER}{}
	\switchMACRO{\LECTURENUM}{\\ \large(\LECTURENUM)}{}
\end{center}
%\vspace*{0.25cm}

\begin{center}
\switchMACRO{\SUBTITLEIMG}{\includegraphics[width=0.7\textwidth]{\SUBTITLEIMG}}{}
\end{center}

%\vspace*{0.25cm}
\ifthenelse{\isundefined{\DATUM} \AND \isundefined{\TOPIC}}{}{
\begin{tabular}[c]{rl}
	\switchMACRO{\DATUM}{{\bf Datum:}& \DATUM\\}{}
	\switchMACRO{\TOPIC}{{\bf Thema:}& \TOPIC\\}{}
\end{tabular}\\}

\noindent\makebox[\linewidth]{\rule{\textwidth}{0.4pt}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%	
}%}{}

%% Close the package
\endinput
