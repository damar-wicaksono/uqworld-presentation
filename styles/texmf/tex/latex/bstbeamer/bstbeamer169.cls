%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Style LaTeX pour la conception de rapports Phimeca %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\@PackageName{bstbeamer169}
\def\@PackageVersion{1.0}
\def\@FirstVersion{06/01/2016}
\def\@FileDate{06/01/2016}

\NeedsTeXFormat{LaTeX2e}[1999/01/01]

\def\fileversion{\@PackageVersion}
\ProvidesClass{\@PackageName}[
     \@FileDate \space Version:\space \@PackageVersion \space ]
\typeout{16-9 beamer class for slides - B. Sudret}
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

% pass on the handout option to the beamer class
\DeclareOption{handout}{
	\PassOptionsToClass{\CurrentOption}{beamer}
}

\DeclareOption*{\typeout{*** Option ``\CurrentOption'' inconnue ***\\ Syntaxe :
documentclass[english]{\@PackageName}}}
\PassOptionsToClass{xcolor=x11names,xcolor=usenames,xcolor=dvipsnames,10pt,aspectratio=169}{beamer}

\ExecuteOptions{10pt}         % Defaults options
\ExecuteOptions{xcolor=x11names}         % Defaults options
\ExecuteOptions{aspectratio=169}         % Defaults options
\ProcessOptions               % Evaluation des declarations d'options

\LoadClass[xcolor=x11names,10pt,aspectratio=169]{beamer}            % Classe de base
%,handout pour faire en handout sans les plans intermédiaires


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%          Extensions requises                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{bstnotations}               % Notations Phimeca
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
\usepackage{pifont}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                       Themes                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\useinnertheme[shadow=true]{rounded}
\useoutertheme{shadow}


%%%%%%%%%%%%%% footline from outer theme ``infolines''
\defbeamertemplate*{footline}{infolines theme}
{
  \leavevmode%
  \hbox{%
  \begin{beamercolorbox}[wd=.333333\paperwidth,ht=2.25ex,dp=1ex,center]{author in head/foot}%
    \usebeamerfont{author in head/foot}\insertshortauthor~~(\insertshortinstitute)
  \end{beamercolorbox}%
  \begin{beamercolorbox}[wd=.333333\paperwidth,ht=2.25ex,dp=1ex,center]{title in head/foot}%
    \usebeamerfont{title in head/foot}\insertshorttitle
  \end{beamercolorbox}%
  \begin{beamercolorbox}[wd=.333333\paperwidth,ht=2.25ex,dp=1ex,right]{date in head/foot}%
    \usebeamerfont{date in head/foot}\insertshortdate{}\hspace*{2em}
    \insertframenumber{} / \inserttotalframenumber\hspace*{2ex} 
  \end{beamercolorbox}}%
  \vskip0pt%
}

% Palette de couleurs principales
\RequirePackage{color}
\definecolor{BleuPhimeca1}{RGB}{107 134 164} % bleu logo foncé
\definecolor{BleuPhimeca2}{RGB}{148 187 227} % bleu logo clair
\definecolor{BleuPhimeca3}{RGB}{72 61 139} % bleu pétillant


\definecolor{Blue1}{RGB}{72 61 139} % bleu pétillant
\definecolor{Violet1}{RGB}{140 92 180} % violet cool
\definecolor{GrisBleuPale}{RGB}{220 225 183} % gris bleu pale


% Palettes
\setbeamercolor*{palette primary}{fg=white,bg=BleuPhimeca1} % couleur cadre sous-titre et cadre haut droite
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

\setbeamercolor*{block title}{bg=BleuPhimeca1, fg=white} % couleur titres blocs
\setbeamercolor*{block title alerted}{parent=alerted text}
\setbeamercolor*{block title example}{bg=BleuPhimeca1!50, fg=white}
\setbeamercolor*{block body}{bg=GrisBleuPale!50} % couleur fond des blocs
\setbeamercolor*{block body alerted}{}
\setbeamercolor*{block body example}{parent=block body}

\setbeamercolor*{alerted text}{fg=Violet1}  % Alerted text
\setbeamercolor{framesubtitle}{fg=white}

\setbeamercolor*{title}{fg=BleuPhimeca3}
\setbeamercolor*{subtitle}{fg=BleuPhimeca3}
\setbeamercolor*{author}{fg=BleuPhimeca3}
\setbeamercolor*{institute}{fg=BleuPhimeca3}

\setbeamercolor{structure}{fg=BleuPhimeca3}

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

% Saut de ligne tableaux
\renewcommand{\arraystretch}{1.2}

% Fond
%\pgfdeclareimage[height=2.5cm]{fond}{Courbe_2}
%\logo{\vbox to 1.9cm{\hbox to 12.8cm{\pgfuseimage{fond}}}}

% Pour eviter les overfull hbox a la compilation
\hbadness=10000
\emergencystretch=\hsize
\tolerance=9999
\endinput
