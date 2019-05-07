% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% Template class for producing standard reports from the Chair of Risk, Safety 					  %
% and Uncertainty Quantification in ETH Zurich.													  %
% Copyright 2013, Stefano Marelli and Bruno Sudret, all rights reserved. 						  %
% Please contact Stefano Marelli (marelli@ibk.baug.ethz.ch) for any template-related enquiries.	  %
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{rsuqpreprint}[2015/02/11 rsuqpreprint]

% Article options (we are based on it)
\DeclareOption{11pt}{
	\PassOptionsToClass{\CurrentOption}{article}
}

%% Fallback
\DeclareOption*{
	\ClassWarning{myclass}{Unknown option '\CurrentOption'}
}


%% Process given options
\ProcessOptions\relax

%% Load base class (paper in a4 format)
\LoadClass[a4paper]{article}


% load the commonly used notations from the bstnotations package
\RequirePackage{bstnotations}

% Page layout: geometry and margins
\RequirePackage[left=1.2cm,bottom=1.5cm, top=1.2cm, right=1.2cm]{geometry}

% Images: need the graphicx package to create the template layout
\RequirePackage{graphicx}


% hyperlinks: let's set them to default colors
\RequirePackage[colorlinks=true, urlcolor=black]{hyperref}
%% And now come the headers


% Now let's define some extra colors for our template
\RequirePackage[usenames,dvipsnames,svgnames,table]{xcolor}
\definecolor{rsuqlightblue}{RGB}{155,175,255} 	% cover page background
\definecolor{ETH1}{RGB}{1,64,128}				% Header background, default ETH color #1

% Page selection package
\RequirePackage{pdfpages}

% Also enable background coloring of full pages
\RequirePackage{pagecolor}

% We need to draw some elements (e.g., the background of the ETH logo in the header)
\RequirePackage{tikz}


% some geometry aesthetics for the boxes around text (used, e.g. around the titlepage)
\setlength{\fboxsep}{0pt}


% we want some conditional logic (for blank pages and multi-language capabilities)
\RequirePackage{ifthen}

% line spacing: this enables some neat line spacing features
\RequirePackage{setspace}
\onehalfspacing


% Font setup
\RequirePackage{charter}
\RequirePackage[utf8]{inputenc}
\RequirePackage{textcomp}



\makeatletter
\RequirePackage{fancyhdr}
\fancypagestyle{rsuqreportpagestyle}{
	%
	\fancyhf{}
	% clear all six fields
	%\fancyhead[RE,LO]{\show@committee, \show@date}
	\fancyhead[R]{\textbf{\textbf{\@title}}}
	\fancyfoot[L]{\small \@date}
	\fancyfoot[R]{\small - \thepage{} -}
	\renewcommand{\headrulewidth}{0.7pt}
	\renewcommand{\footrulewidth}{0pt}
}

% useful commands
% right-aligned arbitrary width column in tabular
\RequirePackage{ctable}

% Bibliography: use the natbib style
\RequirePackage{natbib}

\newcommand{\cleartoodd}{
 \ifthenelse{\isodd{\value{page}}}
 {\clearpage\mbox{}\clearpage}
 {\clearpage}	
}


% Template-specific commands
\newcommand{\howtocite}[1]{\newcommand{\DocCite}{#1}}
\newcommand{\journalname}[1]{\newcommand{\Journal}{#1}}
\newcommand{\dateaccepted}[1]{\newcommand{\AccDate}{#1}}
\newcommand{\datesubmitted}[1]{\newcommand{\SubDate}{#1}}
%\newcommand{\projectID}[1]{\newcommand{\ProjID}{#1}}
\newcommand{\doiref}[1]{\newcommand{\TheDoI}{#1}}
\newcommand{\arxivref}[1]{\newcommand{\ArxivReference}{#1}}
\newcommand{\rsuqref}[1]{\newcommand{\RSUQReference}{#1}}
%\newcommand{\ethprojectname}[1]{\newcommand{\ETHProjName}{#1}}

\newcommand{\pdffile}[1]{\includepdf[pages=-]{#1}}
% Now let's create the cover page at the beginning of the document
\AtBeginDocument{
\thispagestyle{empty}
%\pagecolor{rsuqlightblue}
\singlespacing

{\raggedright
	\begin{tikzpicture}
	\filldraw[color=ETH1,fill=ETH1] (0,0) rectangle(\textwidth, 3.1); 
	%		 \filldraw[color=blue,fill=blue] (0,0) rectangle(\textwidth, 3.1); 
	\end{tikzpicture}
	\vspace{-2.7cm}\\
	\hspace{.68cm}\includegraphics{eth_logo_kurz_neg.pdf}
}

\vspace{.25cm}
\begin{center}
	
	\colorbox{white}{
		\begin{minipage}{.92\textwidth}
			{
				\begin{center}
					\vspace{1.cm}
					\parbox[t][5.cm][c]{\textwidth}{
						\center 
						\huge{\textsc{\@title}}
					}\vspace{.2cm}
					\parbox[t][2cm][t]{\textwidth}{
						\center 
						\Large{\@author}
					}
					\vspace{.3cm}
				\end{center}
			}
		\end{minipage}
	}
	
	
	
	
	\vspace{1.3cm}
	\begin{center}
		%\includegraphics*[width = .928\textwidth, trim = 0 0 0 0]{ReportBackGround.jpg}
		\includegraphics*[width = .928\textwidth, trim = 0 0 0 0]{ReportBackGround_75dpi_1MP.jpg}
	\end{center}
	\vspace{.8cm}
	
	\colorbox{white}{
		\begin{minipage}{.608\textwidth}
			\flushleft
			\textsc{Chair of Risk, Safety and Uncertainty Quantification\\
				Stefano-Franscini-Platz 5\\
				CH-8093 Z\"urich}
		\end{minipage}\begin{minipage}{.31\textwidth}
		\includegraphics*[width = \textwidth]{Logo_small_vector.pdf}
	\end{minipage}
}
\end{center}
\newpage
\newpagecolor{none}
\thispagestyle{empty}
\mbox{}

\noindent

\vspace{2cm}
{\Large Data Sheet}\\

\large
\begin{tabular}{>{\vspace{.2cm}}p{0.2\textwidth}>{\vspace{.1cm}}p{0.7\textwidth}<{\vspace{.1cm}}}
	\hline
%\textbf{ETH Project:} & \ETHProjName \\
%\textbf{Project ID:} & \ProjID \\
\textbf{Journal:} &\Journal\\
\textbf{Report Ref.:} & \RSUQReference\\
\textbf{Arxiv Ref.:} & \ArxivReference\\
\textbf{DOI: } & \TheDoI\\
\textbf{Date submitted:} &\SubDate\\
\textbf{Date accepted: } &\AccDate\vspace{.2cm}\\
\hline
\end{tabular}



\newgeometry{left=3cm,bottom=3cm, top=3cm}
% and start the report at the next odd page
%\cleartoodd


% make the numbering lowercase Roman and starting from page 1 at the abstract
%\setcounter{page}{1}
%\pagenumbering{arabic}

}


%% Close the package
\endinput
