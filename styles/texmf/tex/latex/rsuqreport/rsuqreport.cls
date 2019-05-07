% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% Template class for producing standard reports from the Chair of Risk, Safety 					  %
% and Uncertainty Quantification in ETH Zurich.													  %
% Copyright 2013, Stefano Marelli and Bruno Sudret, all rights reserved. 						  %
% Please contact Stefano Marelli (marelli@ibk.baug.ethz.ch) for any template-related enquiries.	  %
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{rsuqreport}[2013/12/13 rsuqreport]

% Article options (we are based on it)
\DeclareOption{11pt}{
	\PassOptionsToClass{\CurrentOption}{article}
}

%% Fallback
\DeclareOption*{
	\ClassWarning{myclass}{Unknown option '\CurrentOption'}
}

%% Execute default options
\ExecuteOptions{11pt}

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


%% list of macros that enable content to be automatically displayed
\newcommand{\clientname}[1]{\newcommand{\clname}{#1}}
\newcommand{\contractref}[1]{\newcommand{\conref}{#1}}
\newcommand{\contactname}[1]{\newcommand{\contname}{#1}}
\newcommand{\clientaddress}[1]{\newcommand{\claddr}{#1}}
\newcommand{\ethprojectnum}[1]{\newcommand{\ethproj}{#1}}
\newcommand{\reportref}[1]{\newcommand{\repref}{#1}}
\newcommand{\keywords}[1]{\newcommand{\kwords}{#1}}
% re-define the abstract command so that we can use it to create the abstract in a custom position
\newcommand{\reportabstract}[1]{\newcommand{\abstracttxt}{#1}}


% Let's create the cover page at the beginning of the document
\AtBeginDocument{
% No numbers on first page	
\thispagestyle{empty}
% We want those reports to be light blue
%\pagecolor{rsuqlightblue}
\pagecolor{white}
% First page goes single spacing
\singlespacing
% And here we go with the header: a blue (ETH1) rectangle with writings on top
{\raggedright
	% the rectangle
	\begin{tikzpicture}
	\filldraw[color=ETH1,fill=ETH1] (0,0) rectangle(\textwidth, 3.1); 
	\end{tikzpicture}
	\vspace{-2.7cm}\\
	% and the logo 
	\hspace{.68cm}\includegraphics{eth_logo_kurz_neg.pdf}
}
% Now for the author-title central box
\vspace{.45cm}
\begin{center}
	% Let's go for a white colorbox
	\colorbox{white}{
		% the colorbox width is defined by a minipage (useful for reproducing the same dimensions 
		% later on)
		\begin{minipage}{.92\textwidth}
			{
				\begin{center}
					\vspace{1.cm}
					% A text box with fixed height (approx up to 3 lines of text) for the TITLE
					\parbox[t][3.cm][c]{\textwidth}{
						\center
						\Huge{\textsc{\@title}}
					}\vspace{.2cm} % followed by another with approx 2 lines for the AUTHOR NAMES
					\parbox[t][2cm][t]{\textwidth}{
						\center 
						\Large{\@author}
					}
					\vspace{.3cm}
				\end{center}
			}
		\end{minipage}
	}
	
% Once again, we now the center image, with some tweaking to make it fit perfectly
\vspace{3.cm}
\begin{center}
	\includegraphics*[width = .928\textwidth, trim = 0 0 0 0]{ReportBackGround_75dpi_1MP.jpg}
\end{center}
\vspace{.8cm}

% and finally the white footer textbox with address and anything
\colorbox{white}{
	\begin{minipage}{.608\textwidth}
		\flushleft\vspace{.1cm}
		\textsc{Chair of Risk, Safety and Uncertainty Quantification\\
			Stefano-Franscini-Platz 5\\
			CH-8093 Z\"urich}
		\vspace{.1cm}
	\end{minipage}\begin{minipage}{.31\textwidth}
	\hfill\includegraphics*[width = .9\textwidth, trim = 0 200 0 200]{chair_logo.pdf}
\end{minipage}
}
\end{center}

\newpage
\newpagecolor{none}
\thispagestyle{empty}
\mbox{}

% now we create the Report Data Sheet
\pagestyle{empty}


\newgeometry{left=3cm,bottom=3cm, top=3cm}

\textbf{\Large{Report Data Sheet}}

\vspace{1cm}
{\doublespacing
	\begin{tabular}{>{\raggedleft}p{.2\textwidth}<{}p{.7\textwidth}}
		\hline
		Client:  & \clname{} \\
		\hline
		Contract Ref.: & \conref{} \\
		Contact: & \contname{} \\
		Address: & \parbox[t][][t]{5cm}{\claddr{}}\\
		
		ETH Project: & \ethproj{}\\
		\hline
	\end{tabular}
	
	\vspace{2cm}
	\begin{tabular}{>{\raggedleft}p{.2\textwidth}<{}p{.7\textwidth}}
		\hline
		Report Ref. & \repref{}\\
		\hline
		Title: & \@title \\
		Authors:  & \@author\\
		Date: & \@date\\
		
		Signature: & \vspace{3cm} \\
		& \\
		\hline
	\end{tabular}
	
}

% now add the abstract on the next odd page, before the TOC
\cleartoodd

\pagestyle{plain}
% make the numbering lowercase Roman and starting from page 1 at the abstract
\setcounter{page}{1}
\pagenumbering{roman}

\begin{abstract}
	\abstracttxt{}
	
	\vspace{.5cm}
	{
	\textbf{Keywords:} \kwords{}
	}
\end{abstract}


% insert the TOC on a new odd page
\cleartoodd
\tableofcontents

% and start the report at the next odd page
\cleartoodd

% and finally set the fancy headings correctly
\pagestyle{rsuqreportpagestyle}
% make the numbering lowercase Roman and starting from page 1 at the abstract
\setcounter{page}{1}
\pagenumbering{arabic}
}



%% Close the package
\endinput
