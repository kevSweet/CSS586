SELECT *
FROM (SELECT *, ROW_NUMBER() OVER (PARTITION BY b.cmdId ORDER BY a.interestRate ASC) as num --ROW_NUMBER over partition to remove duplicate matches, keeping the match with the biggest difference in interest rate (lowest matching partner's interest rate)
    FROM SECURITIES a 
    JOIN SECURITIES b 
    ON  a.vehicleModelName = b.vehicleModelName AND
        a.vehicleModelYear = b.vehicleModelYear AND
        a.originalLoanTerm = b.originalLoanTerm AND
        a.originationDate = b.originationDate AND 
        a.originatorName = b.originatorName AND
        --ensures rows don't match with themselves since IDs are not ensured to be unique
        --also ensures that we remove permutation of same 2 rows e.g. match AB is not included with match BA
        a.interestRate <= b.interestRate AND
        a.cmdId != b.cmdId AND
        a.subvented = b.subvented AND
        a.coObligorIndicator = b.coObligorIndicator
    WHERE ABS(a.vehicleValueAmount - b.vehicleValueAmount) < 0.1 * a.vehicleValueAmount AND
        ABS(a.obligorCreditScore - b.obligorCreditScore) < 8 AND
        ABS(a.paymentToIncomePercentage - b.paymentToIncomePercentage) < 0.1 * a.paymentToIncomePercentage AND
        ABS(a.originalLoanAmount - b.originalLoanAmount) < 0.05 * a.originalLoanAmount
 )
 WHERE num = 1;
