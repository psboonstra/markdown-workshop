#' ---
#' title: "BDSI R Markdown: Exercise 2"
#' author: "type your name here"
#' date: "8-July-2019"
#' geometry: margin=1.5cm
#' output: 
#'  pdf_document: 
#'    toc: yes
#'  word_document:
#'    toc: yes
#' always_allow_html: yes    
#' header-includes:
#'  - \usepackage{booktabs}
#' ---

#+ echo=F, cache = F, include = F

# Here we create a chunk to set up some background parameters

options(digits = 4); 

library(tidyverse);
library(knitr);

#+ echo=F, cache = F


#' # Main header
#' 
#' This exercise assumes you are reading the `R` script and not the knitted output. 
#' **TASK 1** Add yourself as the author of this document on line 3. 
#' 
#' **TASK 2** When you read this, trying *knitting* this document using *Cmd+Shift+K* /
#' *Ctrl+Shift+K*. Note how Markdown creates an automatic table of contents 
#' with click-able links. 
#' 
#' **TASK 3** Cut the code on lines 9 and 10 and paste them to go before the 
#' code on lines 7 to 8. Then re-knit the document. Notice how **knitr** will 
#' pay attentiononly to the first output selection and ignore all others. Don't 
#' worry if what you knit doesn't look very pretty as a .docx. Now undo what you
#' just did so that your selected output format is again a pdf. 
#' 
#' ## Sub header
#' 
#' Note the clever use of the # sign at the beginning of each line number. 
#' As always, regular `R` will ignore any line that starts with a #, as these do. 
#' Thus, you can treat this script exactly as you would any other `R` script. 
#' But, when you knit this script using **knitr**, the #' indicates to that this 
#' is actually markdown text and should be interpreted as such. **TASK 4** Add 
#' some more text at the end of this sentence and then press *enter* or
#' *return*. 
#' 
#' Notice how `R`Studio automatically added to the #' to the beginning of the line. 
#' 
#' Here is an ordered list.
#' 
#'  (i) item 1
#'  (ii) item 2
#'  (iii) **TASK 5** Here's some perhaps non-intuitive behavior: change the 
#'  '(iii)' to '(iv)' and re-knit the document. Does anything change?
#'   
#' Here we use ">" to indicate the use of a block quote, which will be set off 
#' by indentation. 
#'   
#' > *Professor Zawistowski is a genius*
#' 
#' 
#' 
#' ## Keeping track of your margins
#' 
#' Your knitted document is not affected by single linebreaks. That is, you can
#' press 'enter' once without affecting the appearance of your final document (on
#' the other hand, two linebreaks denote a new paragraph). Take advantage of this 
#' feature to maintain the readability of your text by starting a new line before 
#' you start to spill off the screen of your text editor, like this: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
#' 
#' On my `R`Studio application, I have set it to denote an 80-character width, 
#' which is the approximate point at which I try to jump to a new line when I'm 
#' typing.
#' 
#' **TASK 6** To do this on your own app: go to the `R`Studio menu, 
#' then Preferences > Code > Display > Show Margin. Then enter your desired 
#' width. After pressing 'Ok', you should see a slight vertical line somewhere 
#' towards the right of your screen (depending on your chosen number). 



#+ echo = F, cache = F

# this code is run but printed because we set echo = F above. Thus, neither will
# this comment be printed

x = rnorm(100, mean = -2, sd = 0.5);
y = 3 * x + rnorm(length(x));

#' 
#' ## Some data analyis
#' 
#' I'm using an in-line chunk to report that the observed mean of `x` is `r mean(x)`
#' **TASK 7** Add another in-line chunk to report the observed standard deviation
#' of `x`. 
#' 
#' ## The Datasaurus dozen

#+ echo=T, cache = F

#Here is a regular R comment: it will be printed to the final knitted document 
#if echo = T. You need to run this chunk to install this package once:

if(!require(datasauRus)) install.packages("datasauRus",repos = "http://cran.us.r-project.org");

#You need to run this chunk to lad this package anytime you open R:

library(datasauRus);

#+ echo = F, cache = F

#' 
#' The first chunk you ran above checks to see if a particular package (`datasauRus`,
#' keep reading for a description of these packages) is *installed* on your computer, 
#' i.e. downloaded onto your hard drive. After installing a package, you generally 
#' only ever need to re-install it if you've updated `R` or if the package is updated. 
#' Thus, the chunk first checks to see if each package has already been installed 
#' before trying to re-install it. 
#'  
#' Here's what the top of the datasaura dataset looks like in raw form:

as_tibble(datasaurus_dozen);

#' There are 13 individual datasets included in this dataset, and we can summarize
#' the characteristics of each dataset with this code: 

datasaurus_summarized <- 
  datasaurus_dozen %>%
  group_by(dataset) %>%
  summarize(mean_x = mean(x),
            mean_y = mean(y),
            std_dev_x = sd(x),
            std_dev_y = sd(y),
            corr_x_y = cor(x, y));
print(datasaurus_summarized)

#' Here is how these same summary data look like using **knitr**'s `kable` command:

#+ echo=T, cache = F

kable(datasaurus_summarized);

#' We can also use the **kableExtra** package to make our tables extra fancy. 
#' However, this makes use of some html features the pandoc will not understand 
#' when creating a .docx file. 
#' 
#' **TASK 8** To see this, go back to the YAML header of this document and, 
#' again, cut the code on lines 9 and 10 and paste it before the code on lines 
#' 7 and 8. After knitting, go back to this table: it's just a jumbled mess. 
#' Revert to creating a pdf once again before proceeding.  
#' 
#' The takeaway is this: although you *can* always knit your script to different
#' formats, it will not always be formatted as expected. MS Word files are very 
#' different from pdfs, which are very different from html files. 

#+ echo=T, cache = F

if(!require(kableExtra)) install.packages("kableExtra",repos = "http://cran.us.r-project.org");
library(kableExtra);

kable(datasaurus_summarized, 
      booktabs = T) %>%
  kable_styling(latex_options = c("striped"), 
                stripe_color = "#BFBFBF") %>%
  add_header_above(c(" " = 1, "Summary statistics" = 5));


#' Visually, however, the datasets look much different:

#+ echo = T, cache = F, fig.height = 9, fig.cap = "Same summary statistics, different plots. Roar!"

dino_plot <- 
  ggplot(datasaurus_dozen) +
  geom_point(mapping = aes(x = x, y = y, color = dataset)) +
  theme_grey() +
  theme(legend.position = "none") +
  facet_wrap(~dataset, ncol = 3);
print(dino_plot);


