% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% Template class for producing documents for Baustatik exams at ETH Zurich.				  		  %
% Copyright 2018, Paul-Remo Wagner and Bruno Sudret, all rights reserved. 						  %
% Please contact Paul-Remo Wagner(wagner@ibk.baug.ethz.ch) for any template-related enquiries.	  %
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{bskexam}[2018/10/03 bskexam]

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
\graphicspath{./}

% For last page reference
\RequirePackage{lastpage}

% For conditional logic during typesetting (solution/question etc.)
\RequirePackage{ifthen}

% For changing layout in the middle of the document
\RequirePackage{changepage}

% For lists
\RequirePackage{enumitem}

% For encircled numbers
\RequirePackage{tikz}

% For tables
\RequirePackage{array,multirow}
\newcolumntype{L}[1]{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{C}[1]{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}

% For math environments
\RequirePackage{amsmath,amssymb}

% hyperlinks: let's set them to default colors
\RequirePackage[colorlinks=true, urlcolor=black]{hyperref}

% some geometry aesthetics for the boxes around text (used, e.g. around the titlepage)
\setlength{\fboxsep}{0pt}

% Font and language setup
\RequirePackage[latin1]{inputenc} % this is needed for umlauts
\RequirePackage[ngerman]{babel} % this is needed for umlauts

%Sans Serif
\renewcommand{\familydefault}{\sfdefault}

% Bibliography: use the natbib style
\RequirePackage{natbib}

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
\fancyhead[R]{\footnotesize  
		Prof. Dr. Bruno Sudret}
\fancyhead[L]{\footnotesize  Baustatik I}
\fancyfoot[R]{\footnotesize Seite: \thepage/\pageref{LastPage}}
\fancyfoot[L]{\footnotesize \ASSIST}
\fancyfoot[C]{\footnotesize \SESSION}


% Definition of environment exercise
\newcounter{numexo}
\setcounter{numexo}{0}

\newenvironment{exercise}[1]
{\stepcounter{numexo} {\Large Aufgabe~\thenumexo~(#1~Punkte)}\\[2em]}
{\clearpage}

% Definition of environment solution
\newenvironment{loesung}
{ \small \setlength{\textwidth} {12cm}\hspace*{5mm}{\bf \small L\"osungsweg}\em \begin{adjustwidth}{2em}{0em}}
	{ \hfill $\diamond$ \end{adjustwidth}}

% make the numbering lowercase Roman and starting from page 1 at the abstract
\setcounter{page}{1}
\pagenumbering{arabic}

%----------------------------------------------------------------------
% set start of document with logo etc.
\AtBeginDocument{
\thispagestyle{empty}

\hfill

\begin{minipage}[c]{0.4\linewidth}
	\includegraphics[width=6cm]{eth_logo_black.jpg}
\end{minipage}
\begin{minipage}[c]{0.6\linewidth}
	\begin{flushright} \footnotesize
		Prof. Dr. Bruno Sudret\\[-0.3em]
		Institut f\"ur Baustatik und Konstruktion\\[-0.3em]
		Sessionspr{\"u}fung \SESSION
	\end{flushright}
\end{minipage}

\vspace*{15mm}

\begin{center}
	{\Large \textsf{Baustatik I} \,\textemdash\, Sessionspr{\"u}fung}\\
	{\small (\KURSID)}\\[2em]
	{\Huge \SESSION}\\
	{\small \WOCHENTAG,~\DATUM,~\ZEIT~Uhr,~\RAUM}
\end{center}

\vspace*{4em}
\begin{tabular}{L{0.2\linewidth} C{0.7\linewidth}}
Name, Vorname: & \hfill \\\cline{2-2}\\
Studenten-Nr.: & \hfill \\\cline{2-2}\\
\end{tabular}

\vspace*{2em}
\noindent\makebox[\linewidth]{\rule{\textwidth}{0.4pt}}
\vspace*{2em}

{\Large Bemerkungen}\\
\vspace*{-1.5em}
{\small
\begin{itemize}
	\item Die Aufgaben d{\"u}rfen in beliebiger Reihenfolge bearbeitet werden.
	\item Der L{\"o}sungsweg der Aufgaben muss klar ersichtlich sein. Resultate ohne zugeh{\"o}rigen L{\"o}sungsweg werden nicht bewertet.
	\item F{\"u}r jede Aufgabe ist der entsprechende Papierbogen A3 zu verwenden. Notizen in der Aufgabenstellung werden bei der Bewertung nicht ber{\"u}cksichtigt.
	\item Alle ausgeteilten Unterlagen (Aufgabenstellung und alle Papierb{\"o}gen A3) sind nach Pr{\"u}fungsende mit Namen und Studenten-Nr. versehen abzugeben.
	\item Hilfsmittel: 10 Seiten selbst{\"a}ndig handschriftlich verfasste Zusammenfassung, einfacher Taschenrechner gem{\"a}ss den Richtlinien des D-BAUG, Schreibzeug, Zirkel und Lineal.
	\item Eine Integrationstabelle liegt der Aufgabenstellung bei.
\end{itemize}}
\newpage

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%	
}%}{}

%% Close the package
\endinput
