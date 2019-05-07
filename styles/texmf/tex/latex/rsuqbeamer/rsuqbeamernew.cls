%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Style LaTeX pour la conception de rapports Phimeca %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\@PackageName{rsuqbeamernew}
\def\@PackageVersion{1.0}
\def\@FirstVersion{21/03/2016}
\def\@FileDate{21/03/2016}

\NeedsTeXFormat{LaTeX2e}[1999/01/01]

\def\fileversion{\@PackageVersion}
\ProvidesClass{\@PackageName}[
     \@FileDate \space Version:\space \@PackageVersion \space ]
\typeout{Latex class for RSUQ presentations}
\ProvidesFile{\@PackageName.cls}[\@FileDate \space Version:\space
\@PackageVersion]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%          Definition des options du document          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newif\iffrenchlang   \frenchlangtrue    % Rapport en francais, false => in english

\DeclareOption{english}{%
   \typeout{\@PackageName.cls : ``english'' option}%
   \frenchlangfalse
}
\DeclareOption{handout}{
	\PassOptionsToClass{\CurrentOption}{beamer}
} 


\DeclareOption*{\typeout{*** Option ``\CurrentOption'' inconnue ***\\ Syntaxe :
documentclass[english]{\@PackageName}}}
\PassOptionsToClass{xcolor=x11names,10pt}{beamer}

\ExecuteOptions{10pt}         % Defaults options
\ExecuteOptions{xcolor=x11names}         % Defaults options
\ProcessOptions               % Evaluation des declarations d'options

\LoadClass[xcolor=x11names,10pt]{beamer}            % Classe de base
%,handout pour faire en handout sans les plans intermédiaires


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%          Extensions requises                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{../bstnotations/bstnotations}               % Notations of the Chair
\RequirePackage[english]{babel}         % Pour adopter les regles de typographie francaise ou anglaise
\RequirePackage[latin1]{inputenc}               % Support de l'accentuation des lettres
\RequirePackage{lmodern}                        % Police latin modern vectorielle
%\RequirePackage{lucidbry}                       % Police Lucida Bright complete (toutes series, toutes formes)
\RequirePackage{graphicx}                       % Pour inserer des images en une ligne
\RequirePackage{xcolor}                         % Couleurs & tableaux
\RequirePackage{colortbl}                       % Couleurs & tableaux
\RequirePackage{tabularx}                       % Environnement de tableaux ameliore
\RequirePackage{tikz}                           % Dessin 
\usetikzlibrary {shapes}
\usetikzlibrary {arrows}
\RequirePackage{pifont}
\RequirePackage{amsmath}
\RequirePackage{mcode}
\RequirePackage{listings}
\lstset{language=Matlab,
	basicstyle=\scriptsize\upshape\ttfamily,
	keywordstyle=\color{blue},
	numberstyle=\tiny,
	commentstyle=\scriptsize\upshape\ttfamily\bf,
	breaklines=false,
	showstringspaces=false,
	morekeywords={uqlab,uq_retrieveSession,uq_createInput,uq_createModel,
		uq_createAnalysis,	uq_createDispatcher,uq_setWorkflow,UQ_input, 
		uq_runAnalysis, uq_evalModel, uq_getSample},
	xleftmargin=.3cm,
	aboveskip=2mm,
	belowskip=2mm,
	tabsize=2,
	breaklines=false,
	xleftmargin=.3cm
}
%\lstset{language=Matlab,
%numberstyle=\tiny,
%basicstyle=\tiny,
%breaklines=false,
%xleftmargin=.3cm
%}


\lstset{tabsize=2}

\mode<presentation> {
	\setbeamercovered{transparent}
}

%\setbeamertemplate{blocks}[rounded][shadow=false]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                       Themes                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\usetheme{Luebeck}
%\useinnertheme[shadow=true]{rounded}
\useinnertheme[]{circles}
\useoutertheme[]{infolines}

% Palette de couleurs principales
\RequirePackage{color}
%old colors for compatibility
\definecolor{BleuPhimeca1}{RGB}{107 134 164} % bleu logo foncé
\definecolor{BleuPhimeca2}{RGB}{148 187 227} % bleu logo clair
\definecolor{BleuPhimeca3}{RGB}{72 61 139} % bleu pétillant
\definecolor{Blue1}{RGB}{72 61 139} % bleu pétillant
\definecolor{Violet1}{RGB}{140 92 180} % violet cool
\definecolor{GrisBleuPale}{RGB}{220 225 183} % gris bleu pale

\definecolor{rsuqlightblue}{RGB}{155,175,255} 	% cover page background
\definecolor{ETH1}{RGB}{31,64,122}      % ETH1 % Header background, default
\definecolor{ETH2}{RGB}{60,90,15}       % ETH2
\definecolor{ETH3}{RGB}{0,105,180}      % ETH3
\definecolor{ETH4}{RGB}{114,121,28}     % ETH4
\definecolor{ETH5}{RGB}{145,5,106}      % ETH5
\definecolor{ETH6}{RGB}{111,111,110}    % ETH6
\definecolor{ETH7}{RGB}{168,50,45}      % ETH7
\definecolor{ETH8}{RGB}{0,122,146}      % ETH8
\definecolor{ETH9}{RGB}{149,96,19}      % ETH9
\definecolor{ETH10}{RGB}{130,190,30}    % ETH10

\definecolor{UQLabOrange}{RGB}{250,124,7} 		% UQLab Orange
\definecolor{UQLabBlue}{RGB}{46,63,250}			% UQLab Blue

% Palettes
\setbeamercolor*{palette primary}{fg=white,bg=ETH1} % couleur cadre 
%sous-titre 
%et cadre haut droite
\setbeamercolor*{item}{fg=ETH1}
\setbeamercolor*{palette secondary}{parent=palette primary,use=palette primary,bg=palette primary.bg!95!black}
\setbeamercolor*{palette tertiary}{parent=palette primary,use=palette primary,bg=palette primary.bg!85!black}
\setbeamercolor*{palette quaternary}{parent=palette primary,use=palette primary,bg=palette primary.bg!85!black} % couleur cadre haut gauche

\setbeamercolor*{sidebar}{parent=palette primary}
\setbeamercolor*{palette sidebar primary}{fg=white}
\setbeamercolor*{palette sidebar secondary}{fg=black}
\setbeamercolor*{palette sidebar tertiary}{fg=white}
\setbeamercolor*{palette sidebar quaternary}{fg=black}
\setbeamercolor*{titlelike}{parent=palette primary}

\setbeamercolor*{separation line}{}
\setbeamercolor*{fine separation line}{}

%\setbeamercolor*{block title}{bg=BleuPhimeca1, fg=white} % couleur titres blocs
%\setbeamercolor*{block title alerted}{parent=alerted text}
%\setbeamercolor*{block title example}{bg=BleuPhimeca1!50, fg=white}
%\setbeamercolor*{block body}{bg=GrisBleuPale!50} % couleur fond des blocs
%\setbeamercolor*{block body alerted}{}
%\setbeamercolor*{block body example}{parent=block body}
\setbeamercolor*{block title}{bg=ETH1, fg=white} % couleur titres blocs
\setbeamercolor*{block title alerted}{parent=alerted text}
\setbeamercolor*{block title example}{bg=BleuPhimeca1!50, fg=white}
\setbeamercolor*{block body}{bg=ETH1!10} % couleur fond des blocs
\setbeamercolor*{block body alerted}{}
\setbeamercolor*{block body example}{parent=block body}

\setbeamercolor*{alerted text}{fg=ETH1}  % Alerted text
\setbeamercolor{framesubtitle}{fg=white}

\setbeamercolor*{title}{fg=black}
\setbeamercolor*{subtitle}{fg=black}
\setbeamercolor*{author}{fg=ETH1}
\setbeamercolor*{institute}{fg=ETH1}

\setbeamercolor{structure}{fg=ETH1}

% Color the tocv and outlines
\usecolortheme[named=ETH1]{structure}

% Font size
\setbeamerfont*{block title}{size={}}
\setbeamerfont*{frametitle}{size=\Large}
\setbeamerfont*{framesubtitle}{size=\normalsize}
\setbeamerfont*{author in head/foot}{size=\tiny}
\setbeamerfont*{title in head/foot}{size=\tiny}
\setbeamerfont*{date in head/foot}{size=\tiny}
\setbeamerfont*{section in palette primary}{size=\footnotesize}
\setbeamerfont*{section in palette quarternary}{size=\footnotesize}
\setbeamerfont*{title}{size=\Large}
\setbeamerfont*{author}{size=\normalsize}
\setbeamerfont*{institute}{size=\footnotesize}

% Equations fonts
\usefonttheme[onlymath]{serif}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                       qq options                     %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newenvironment{citeXL}
{\begin{flushright}\tiny \itshape	\color{structure} [}
{] \end{flushright}}


\newcolumntype{Y}{>{\centering\arraybackslash}X}
\newcommand{\lratio}[1]{\setlength{\hsize}{#1\hsize}}
\RequirePackage{multirow}                       % Cellules multilignes
\def\hlinewd#1{%                                % Macro epaisseurs de lignes horizontales
\noalign{\ifnum0=`}\fi\hrule \@height #1 %
\futurelet\reserved@a\@xhline}
\newcommand{\hlineT}{\hlinewd{1.1pt}}
\newcommand{\hlineB}{\hlinewd{0.85pt}}

\newcommand{\secoutline}{
	\begin{frame}[t]{Outline}
		{}
		\addtocounter{framenumber}{-1}
		\tableofcontents[sectionstyle=show/shaded,subsectionstyle=show/show/hide]
	\end{frame}
}

\newcommand{\subsecoutline}{
	\begin{frame}[t]{Outline}
		{}
		\addtocounter{framenumber}{-1}
		\tableofcontents[sectionstyle=show/shaded,subsectionstyle=show/show/hide]
	\end{frame}
}


% Saut de ligne tableaux
\renewcommand{\arraystretch}{1.2}
%\renewcommand{\Tit}[1]{{\normalsize \color{ETH1} #1}}

\hbadness=10000
\emergencystretch=\hsize
\tolerance=9999

% % Remove navigation symbols
\usenavigationsymbolstemplate{}


%% Set proper margins
\setbeamersize{text margin left=7mm, text margin right = 7mm } 


% Put stuff at the beginning of the document automatically
\AtBeginDocument{
%% Create a titlepage/frontpage
\begin{frame}[plain]
	\vspace*{-5cm}
	\begin{tikzpicture}[remember picture,overlay]
	\node[at=(current page.center)] {
		\includegraphics[width=1.\paperwidth]{ETH_FirstPage_noborder_new.pdf}
	};
	\end{tikzpicture}
	
	\vspace*{2.8cm}
	\noindent
	\centering
	\begin{minipage}[t]{.83\paperwidth}
		\hspace{-.2cm}\colorbox{white}{
		\parbox[c][3.3cm][t]{\textwidth}{
			\vspace{.2cm}
			\titlepage
		}
	}
	\end{minipage}
	
\end{frame}

}

\endinput
