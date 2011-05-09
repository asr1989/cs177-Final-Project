a = buildFIS();

userAge = input('Please input your age: ');
userIncome = input('Please input your annual income (in thousands): ');

userAversion = evaluateFIS(userIncome, userAge, a);
displayFIS(a) % Activate to display fuzzy interface system

importFactors;
optimPort(Returns, Covariance, userAversion)