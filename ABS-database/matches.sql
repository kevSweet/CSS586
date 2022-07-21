SELECT * 
FROM SECURITIES a 
JOIN SECURITIES b 
ON a.vehicleModelYear = b.vehicleModelYear AND
    a.vehicleModelName = b.vehicleModelName AND
    a.originalLoanTerm = b.originalLoanTerm AND
    a.originationDate = b.originationDate AND 
    a.originatorName = b.originatorName AND
    --ensures rows don't match with themselves since IDs are not ensured to be unique
    --also ensures that we remove permutation of same 2 rows e.g. match AB is not included with match BA
    a.originalLoanAmount < b.originalLoanAmount
WHERE ABS(a.vehicleValueAmount - b.vehicleValueAmount) < 0.1 * a.vehicleValueAmount AND
    ABS(a.obligorCreditScore - b.obligorCreditScore) < 8 AND
    ABS(a.paymentToIncomePercentage - b.paymentToIncomePercentage) < 0.1 * a.paymentToIncomePercentage AND
    ABS(a.originalLoanAmount - b.originalLoanAmount) < 0.05 * a.originalLoanAmount;