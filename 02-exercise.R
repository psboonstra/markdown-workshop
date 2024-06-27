#' ---
#' title: "BDSI R Markdown: Exercise 2"
#' author: "type your name here"
#' date: "3-July-2023"
#' geometry: margin=1.5cm
#' output: 
#'  html_document:
#'    toc: yes
#'  pdf_document: 
#'    toc: yes
#'  word_document: 
#'    toc: yes
#' always_allow_html: yes    
#' ---
#' 
#'<style type="text/css">
#'  body{
#'  font-size: 18pt;
#'}
#'  pre{
#'  font-size: 18pt;
#'}
#'</style>
  

#+ echo=F, cache = F, include = F

options(digits = 4); 
if(!require(tidyverse, quietly = TRUE)) {install.packages("tidyverse",repos = "http://cran.us.r-project.org");library(tidyverse)}
if(!require(knitr, quietly = TRUE)) {install.packages("knitr",repos = "http://cran.us.r-project.org");library(knitr)}

#+ echo=F, cache = F

#' # Main header
#' 
#' This exercise assumes you are reading the `R` script and not the knitted
#' output.
#' 
#' **Task 1** Add yourself as the author of this document on line 3. 
#' 
#' **Task 2** *Knit* this document using *Cmd+Shift+K* /
#' *Ctrl+Shift+K*. Note how Markdown creates an automatic table of contents 
#' with click-able links. Or use the `render` command. 
#' 
#' **Task 3** On line 7 change `html_document` to `word_document`, and on line
#' 11 change `word_document` to `html_document`. **knitr** will 
#' pay attention only to the first output selection and ignore all others. Don't 
#' worry if what you knit doesn't look very pretty as a .docx. Now undo what you
#' just did so that your selected output format is again an html.
#' 
#' ## Sub header
#' 
#' Note the clever use of the # sign at the beginning of each line number. 
#' As usual, "regular" `R` will ignore any line that starts with a #, as these do. 
#' Thus, you can treat this script exactly as you would any other `R` script. 
#' But, when you knit this script using **knitr**, the #' (the hash followed by an
#' apostrophe) indicates to that this is actually markdown text and should 
#' be interpreted as such. **Task 4** Add some more text after this sentence
#' and then press *enter* or *return*.
 

#' RStudio should automatically added an #' at the beginning of each new line
#' that you start.  
#' 
#' 
#' ## Keeping track of your margins
#' 
#' Your knitted document is not affected by single linebreaks. That is, you can
#' press 'enter' once without affecting the appearance of your final document. On
#' the other hand, two linebreaks denote a new paragraph. Take advantage of this 
#' feature to maintain the readability of your text by starting a new line before 
#' you start to spill off the screen of your text editor, like this: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
#' 
#' On my RStudio application, I have set it to denote an 80-character width,
#' which is the approximate point at which I try to jump to a new line when I'm
#' typing.
#'
#' **Task 6** To do this on your own app: go to Tools > Global Options, then
#' then Code > Display > Show Margin. Then enter your desired width under Margin
#' Column. After pressing 'Ok', you should see a slight vertical line somewhere
#' towards the right of your screen (depending on your chosen number).
#' 
#' 
#' **Task 7** Once you have set margins, you can tell RStudio to automatically add a 
#' line break to any line that goes past the margin. This is called 'reflowing'. First, 
#' highlight the paragraph to be reflowed, and then go to Code > Reflow Comment. On
#' a Mac, the keyboard shortcut is  *Shift+Ctrl+/*. Practice by reflowing this paragraph.


#+ echo = F, cache = F

# We can also write regular R comments. Note that the beginning of these lines
# start with a regular pound sign / hashtag. Code inside this chunk is run but 
# not printed because we set echo = F above. Thus, neither will
# these comments be printed. Inspect the knitted document to see for yourself. 

x = rnorm(100, mean = -2, sd = 0.5);
y = 3 * x + rnorm(length(x));

#' 
#' ## Some data analysis
#' 
#' I'm using an in-line chunk to report that the observed mean of `x` is `r mean(x)`
#' **Task 8** Add another in-line chunk to report the observed standard deviation
#' of `x`. 
#' 
#' ## The Datasaurus dozen

#+ echo=T, cache = F

if(!require(datasauRus, quietly = TRUE)) {install.packages("datasauRus",repos = "http://cran.us.r-project.org");library(datasauRus)}

# If the package is installed and you just want to load it, you can also use this code:

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
#' Here's what the top of the datasauras dataset looks like in raw form:

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
#' Below we have an improved version of the table above:

#+ echo=T, cache = F

if(!require(kableExtra, quietly = TRUE)) {install.packages("kableExtra",repos = "http://cran.us.r-project.org");library(kableExtra);}

kable(datasaurus_summarized) %>%
  kable_styling(bootstrap_options = c("striped", "hover", "condensed", "responsive")) %>%
  add_header_above(c(" " = 1, "Summary statistics" = 5));


#' However, **kableExtra** makes use of some features that will not work for all
#' file formats.
#' 
#' **Task 9** To see this, go back to the YAML header of this document and, 
#' again, On line 7 change `html_document` to `word_document`, and on line
#' 11 change `word_document` to `html_document`. After knitting, go back to 
#' this table: it's just a jumbled mess. Do the same thing, now knitting
#' to a pdf (knitting to a pdf will only work if you have a Tex distribution
#' installed). The knitted pdf should have stripes; the html version will not.
#' 
#' The takeaway is this: although you *can* always knit your script to different
#' formats, it will not always be formatted as expected. MS Word files are very 
#' different from html, which are very different from pdf files. I find pdf
#' files to be the most pleasing to look at and easiest to share with collaborators.


#' Visually, the datasets look much different:

#+ echo = T, cache = F, fig.height = 9, fig.cap = "Same summary statistics, different plots. Roar!"

dino_plot <- 
  ggplot(datasaurus_dozen) +
  geom_point(mapping = aes(x = x, y = y, color = dataset)) +
  theme_grey() +
  theme(legend.position = "none") +
  facet_wrap(~dataset, ncol = 3);
print(dino_plot);


