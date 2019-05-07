% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% Template class for producing standard reports from the Chair of Risk, Safety 					  %
% and Uncertainty Quantification in ETH Zurich.													  %
% Copyright 2013, Stefano Marelli and Bruno Sudret, all rights reserved. 						  %
% Please contact Stefano Marelli (marelli@ibk.baug.ethz.ch) for any template-related enquiries.	  %
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{rsuqposterA0}[2013/12/13 rsuqposterA0]



%% Fallback
\DeclareOption*{
	\ClassWarning{myclass}{Unknown option '\CurrentOption'}
}


%% Process given options
\ProcessOptions\relax

%% Load base class (paper in a4 format)
\LoadClass[portrait, a0]{a0poster}


% load the commonly used notations from the bstnotations package
\RequirePackage{bstnotations}

% Page layout: geometry and margins
\RequirePackage[left=2.8cm,bottom=2.8cm, top=2.8cm, right=2.8cm]{geometry}

% Images: need the graphicx package to create the template layout
\RequirePackage{graphicx}


% hyperlinks: let's set them to default colors
\RequirePackage[colorlinks=true, urlcolor=black]{hyperref}
%% And now come the headers


% Now let's define some extra colors for our template
\RequirePackage[usenames,dvipsnames,svgnames,table]{xcolor}
\definecolor{rsuqlightblue}{RGB}{155,175,255} 	% cover page background
\definecolor{ETH1}{RGB}{31,64,128}	%dark blue			% Header background, default ETH color #1
\definecolor{ETH2}{RGB}{72,90,44}	%dark green
\definecolor{ETH3}{RGB}{18,105,176} %blue
\definecolor{ETH4}{RGB}{114,121,28} %lite green
\definecolor{ETH5}{RGB}{145,5,106}  %pink
\definecolor{ETH6}{RGB}{111,111,100}%gray
\definecolor{ETH7}{RGB}{168,50,45}  %red
\definecolor{ETH8}{RGB}{0,122,150}  %lite blue
\definecolor{ETH9}{RGB}{149,96,19}  %brown
\definecolor{rsuqpink}{RGB}{241,4,82}
\definecolor{grayish}{RGB}{200,200,200}

% Also enable background coloring of full pages
\RequirePackage{pagecolor}

% We need to draw some elements (e.g., the background of the ETH logo in the header)
\RequirePackage{tikz}


% some geometry aesthetics for the boxes around text (used, e.g. around the titlepage)
\setlength{\fboxsep}{10pt}


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

% useful commands
% right-aligned arbitrary width column in tabular
\RequirePackage{ctable}

% Bibliography: use the natbib style
\RequirePackage{natbib}



%% list of macros that enable content to be automatically displayed
\newcommand{\clientname}[1]{\newcommand{\clname}{#1}}
\newcommand{\contractref}[1]{\newcommand{\conref}{#1}}
\newcommand{\contactname}[1]{\newcommand{\contname}{#1}}
\newcommand{\clientaddress}[1]{\newcommand{\claddr}{#1}}
\newcommand{\ethprojectnum}[1]{\newcommand{\ethproj}{#1}}
\newcommand{\reportref}[1]{\newcommand{\repref}[1]{#1}}
\newcommand{\rsuqfooter}{
	\begin{center}
	\vfill
	\colorbox{white}{
		\begin{minipage}{.608\textwidth}
			\flushleft\vspace{.1cm}
			\textsc{Chair of Risk, Safety and Uncertainty Quantification\\
				Stefano-Franscini-Platz 5\\
				CH-8093 Z\"urich}
			\vspace{.1cm}
		\end{minipage}\begin{minipage}{.31\textwidth}
		\hfill\includegraphics*[width = .9\textwidth, trim = 0 220 0 220]{chair_logo.pdf}
	\end{minipage}
	}
	\end{center}
}
% re-define the abstract command so that we can use it to create the abstract in a custom position
\newcommand{\reportabstract}[1]{\newcommand{\abstracttxt}{#1}}



% Now let's create the cover page at the beginning of the document
\AtBeginDocument{

\thispagestyle{empty}
\pagecolor{grayish}
\singlespacing
\makeatletter
{\raggedright
	\begin{tikzpicture}
	\filldraw[color=ETH1,fill=ETH1] (0,0) rectangle(\textwidth, 12.4); 
	%		 \filldraw[color=blue,fill=blue] (0,0) rectangle(\textwidth, 3.1); 
	\end{tikzpicture}
	\vspace{-10.2cm}\\
	\hspace{3.6cm}\includegraphics[height = 3.2cm]{eth_logo_kurz_neg.pdf}
}

\vspace{2.45cm}
\begin{center}
	
	\colorbox{white}{
		\begin{minipage}{.92\textwidth}
			{
				\begin{center}
					\vspace{1.cm}
					\parbox[t][3.cm][c]{\textwidth}{
						\center 
						\VERYHuge{\textsc{\@title}}
					}\vspace{1.2cm}
					\parbox[t][2cm][t]{\textwidth}{
						\center 
						\veryHuge{\@author}
					}
					\vspace{1.3cm}
				\end{center}
			}
		\end{minipage}
	}
\end{center}
}



%% Close the package
\endinput
