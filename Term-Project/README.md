# XAI Applications in Automobile Financing Default
---

# Project Description
This project was to tasked with assessing the viability of using Anchors, an XAI framework, to provide explanations for a blackbox auto loan default model. The data originates from [EDGAR, a public repository of SEC filings.] (https://finsight.com/us-abs-loan-level-data-on-edgar) These SEC filings contain loan-level data on various vehicles, including the loan delinquency/default status. This data was first collected (Data Collection.ipynb), preprocessed (Data PreProcessing.ipynb and Tableau Prep), and then modeled (Default Modeling and XAI.ipynb). 

# Project Extension: Measuring Differences in Interest Rates for Similar Credit Profiles
Using the same ABS filings dataset, a search was performed to identify close matching loans to determine whether the same lender is providing disparate treatment to different customers. This analysis is found in "Matching Pairs.ipynb". The matching criteria were as follows:
* Same Model Year
* Same Model
* Same Loan Term
* Same Origination Month
* Vehicle Value: +/- 10% of value A
* Credit Score: +/- 7 points of value A
* PTI: +/- 10% of value A
* Loan Amount: +/- 5%


# Install And Reproduction Instructions

If you would like to reproduce data collection and preprocessing, follow these steps:
* Install jupyter notebook
* Use pip or conda to install each package in the jupyter notebook files
* Install chrome web driver for selenium
* Run Data Collection.ipynb to collect the csv files
* Follow the steps in PreProcessing.ipynb to merge, filter, clean and reshape the data using the notebook, manual file system filtering, and running the included prep_flow.tfl file using [tableau prep] (https://www.tableau.com/products/prep)

If you want to reproduce the default modeling and XAI framework, follow these steps:
* Retrieve preprocessed.csv from the preprocessing steps above or included in the zip file. If you do not have access to the data, reach out to me at ksweet1@uw.edu
* install jupyter notebook
* Use pip to install each required package in Default Modeling and XAI.ipynb
* Run Default Modeling and XAI.ipynb

If you want to reproduce the matching pairs analysis, follow these steps:
* retrieve the cleaned dataset through the data collection and preprocessing steps above
* install the required packages
* identify the lender you wish to compare and modify the dataframe filtering for that lender and the vehicles they service. If you do not filter down the dataset, the matching process will take an extremely large amount of time to search through every combination of vehicle, year, make, model, and origination date. There is most certainly a better way to do this, but as this is a single run analysis, I didn't see a reason to spend as much time on optimization.

