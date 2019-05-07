\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{MascotNumAbstract}[2013/09/25 MascotNumAbstract]

%% Article options
\DeclareOption{10pt}{
	\PassOptionsToClass{\CurrentOption}{article}
}

%% Fallback
\DeclareOption*{
	\ClassWarning{myclass}{Unknown option '\CurrentOption'}
}


%% Custom package options
\DeclareOption{sansserif}{
	\PassOptionsToPackage{\CurrentOption}{paxcommands}
}
\DeclareOption{neverindent}{
	\PassOptionsToPackage{\CurrentOption}{paxcommands}
}


%% Execute default options
\ExecuteOptions{10pt}

%% Process given options
\ProcessOptions\relax

%% Load base class (paper in a4 format)
\LoadClass[a4paper,twoside]{article}

% Page layout
\RequirePackage[left=2.5cm,right=2.5cm,top=1in,bottom=1in]{geometry}
\RequirePackage{graphicx}

% Amsmath package
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsthm}

% hyperlinks
\RequirePackage[colorlinks=true, urlcolor=black, linkcolor=black, citecolor=black]{hyperref}
%% And now come the headers

\RequirePackage{fancyhdr}
\fancypagestyle{firstpage}{
	%
	\fancyhf{}
	% clear all six fields
	\renewcommand{\headrulewidth}{0pt}
	\renewcommand{\footrulewidth}{0pt}
	\fancyhead[R]{\textbf{MascotNum Annual Conference, April 23-25,
            2014, ETH Z\"urich (Switzerland)}}
}
\fancypagestyle{followingpage}{
	%
	\fancyhf{}
	% clear all six fields
	%\fancyhead[RE,LO]{\show@committee, \show@date}
	\fancyhead[RE,RO]{\textbf{\textbf{MascotNum Annual Conference, April 23-25,
            2014, ETH Z\"urich (Switzerland)}}}
	\fancyfoot[LE,LO]{\small \textbf{\runauthor{},  \runtitle{}}}
	\fancyfoot[RE,RO]{\small - \thepage{} -}
	\renewcommand{\headrulewidth}{0.7pt}
	\renewcommand{\footrulewidth}{0pt}
}
%\pagestyle{followingpage}
\pagestyle{empty}

\setlength{\parindent}{0em}
\setlength{\parskip}{1.3ex plus 0.5ex minus 0.2ex}


%% useful header macros
\newcommand{\shorttitle}[1]{\newcommand{\runtitle}{#1}}
\newcommand{\shortauthor}[1]{\newcommand{\runauthor}{#1}}
\newcommand{\firstauthoraddress}[1]{\newcommand{\authaddr}{#1}}
\newcommand{\masteruniversity}[1]{\newcommand{\masteruni}{#1}}
\newcommand{\phdtime}[1]{\newcommand{\phdt}{(#1)}}
\newcommand{\phduniversity}[1]{\newcommand{\univ}[1]{#1}}
\newcommand{\correspondingauthor}[1]{\newcommand{\cauthor}{#1}}
\newcommand{\contactmail}[1]{\newcommand{\cmail}{#1}}
\newcommand{\webaddress}[1]{\newcommand{\waddress}{#1}}
\newcommand{\supervisors}[1]{\newcommand{\superv}{#1}}
% setting page style on the first page (no fancy headings)
%\AtBeginDocument{\thispagestyle{firstpage}}
\AtBeginDocument{\thispagestyle{empty}}

% Creating the title page
\AtBeginDocument{

\begin{minipage}{.1\textwidth}
	~
\end{minipage}
\begin{minipage}{.89\textwidth}
%	\textsc{Ph.D. student presentation}\vspace{.3cm}\\
	\textbf{\Large{\@title}}\vspace{.5cm}\\
	\textsc{\@author}\\
	\textit{\univ}\vspace{1cm}\\
\end{minipage}
\thispagestyle{empty}

\textbf{Affiliation}:   \authaddr{}

\textbf{Email}: \href{mailto:\cmail}{\nolinkurl{\cmail}} --
\textbf{URL}: \href{\waddress}{\nolinkurl{\waddress}}

\textbf{Master:} \masteruni{}

\textbf{Ph.D.} \phdt{}: \univ{}

\textbf{Supervisor(s):} \superv{}

\vspace*{1cm}
\textbf{Abstract: }
}

%% Close the package
\endinput
