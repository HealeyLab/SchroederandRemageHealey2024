# SchroederandRemageHealey2024

Data, associated code, and detailed statistial output from the article "Social experience shapes forebrain responsiveness before the sensitive period of vocal learning." Further information, questions, and requests should be directed to Luke Remage-Healey (healey@cns.umass.edu).

## Description of the data and file structure

#### CSV files

**XfosteringUnitSummary_Sheet1.csv:** Summary sheet including bird subject information, treatment, depth, and waveform measurements for each unit.

**stimframe.csv**: Data indicating which stimulus set was used for each trial. Data in this file are associated with R code entitled “Xfostering_StatisticalAnalysis_anonymized.Rmd.”

**StimulusDurationsCh2.csv:** Includes durations in seconds of all stimuli used in this experiment. Data in this file are associated with R code entitled “Xfostering_StatisticalAnalysis_anonymized.Rmd.”

**frates_wide2.csv:** Data including raw baseline firing rates (base_fr column) and stimulus-evoked (stim_fr column) for each unit for each presentation of a stimulus. There are 15 or 20 presentations for each of 5 stimuli (or 4 in a few cases) for each unit. Data in this file are associated with R code entitled “Xfostering_StatisticalAnalysis_anonymized.Rmd.”

**firezals_sum.csv**: Data on electrophysiological responses including average firing rates, z-scores, waveform measurements, accuracy scores from pattern classifier, and latency averages. There is one row per unit-stimulus combination. Data in this file are associated with R code entitled “Xfostering_StatisticalAnalysis_anonymized.Rmd.”

**dprime_wn.csv**: Data including response strength (“RS_WN”) and response variance (“pop_var_WN”) columns representing responses during white noise stimuli. These columns were used to calculate d prime for the dprime.csv file. There is one row per each unit that heard white noise, and only responses to the white noise stimulus are represented here. Data in this file are associated with R code entitled “Xfostering_StatisticalAnalysis_anonymized.Rmd.” Code for calculations of response strength and variance can be found in “dprime_calculation.R”.

**dprime.csv:** Data including d prime values (“dprime” column) for each unit-song stimulus combination indicating selectivity for that song over white noise. D prime is calculated here with songs (zebra finch or Bengalese finch) as the stimulus of interest and white noise as a comparison stimulus. There is one row per each unit-song stimulus combination (i.e. 4 rows per unit in most cases). Data in this file are associated with R code entitled “Xfostering_StatisticalAnalysis_anonymized.Rmd.” Code for calculations of response strength, variance, and d prime can be found in “dprime_calculation.R”.

**dprime_species.csv:** Data including d prime values (“dprime” column) for each unit indicating selectivity of zebra finch songs over Bengalese finch songs. D prime is calculated here with zebra finch songs as the stimulus of interest and Bengalese finch songs as the comparison stimulus. There is one row per unit. One unfamiliar zebra finch song and one unfamiliar Bengalese finch song were randomly chosen for each unit for this calculation. Data in this file are associated with R code entitled “Xfostering_StatisticalAnalysis_anonymized.Rmd.” Code for calculations of response strength, variance, and d prime can be found in “dprime_calculation.R”.

**frates_wide2.csv:** Data including raw baseline firing rates (base_fr column) and stimulus-evoked (stim_fr column) for each unit for each presentation of a stimulus. There are 15 or 20 presentations for each of 5 stimuli (or 4 in a few cases) for each unit. Data in this file are associated with R code entitled “Xfostering_StatisticalAnalysis_anonymized.Rmd.”

**fullsummary_CDFG.csv**: Summary of behavioral data for each subject. There are two rows for each subject, one for the zebra finch song and one for the Bengalese finch song they heard during their behavioral trial. Values in Prestim and Stim columns are the exact counts of behaviors (head tilts, head turns, neck stretches, and gapes) performed during each period. Standstim column counts  Data in this file are associated with R code entitled “Xfostering_StatisticalAnalysis_anonymized.Rmd.”



## Code Files

R version 4.3.1 (2023-06-16) was used for the following files.

**Xfostering_StatisticalAnalysis_anonymized.Rmd**: Code used to perform all statistical analysis. All csv files in this folder are necessary as input.

**dprime_calculation.R**: Code used for calculations of d prime. Input file is “firezals_sum.csv.”



## Supplemental Files

**Xfostering_StatisticalAnalysis.html**: Knitted version of “Xfostering_StatisticalAnalysis_anonymuzed.Rmd” including output.

**Key_files.zip**: Zip file containing one csv file for each unit containing the time stamps for each stimulus presentation during the trial. File names indicate, in order, bird ID, brain region, trial number, and stimulus set.

**Spike_times.zip**: Zip file containing one txt file for each unit containing the time stamps for each spike during the trial. This folder may contain units excluded from final analyses. File names indicate, in order, bird ID, brain region, trial number, and unit ID.

**StatisticsTables.pdf**: Details on model specification and statistical output from GLMM/LMM models for seven predictor variables.

