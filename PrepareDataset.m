
% read features
features = csvread('x_train_gr_smpl.csv');

% read targets (class labels)
targets = csvread('y_train_smpl.csv');

% merge features and targets
train = [features, targets];

% reduce the size of the dataset
[i1,i2,i3] = dividerand(size(train,1), 0.6,0.3, 0.1);
t=train(i3,:);

% split the reduced dataset into train and test datasets 
[i1,i2,i3] = dividerand(size(t,1), 0.4,0.3, 0.3);
train_data=t(i1,:);
test_data=t(i2,:);

t3 = train_data;
t4 = test_data;
 
x=1:2305; % column numbers

% add column numbers to datasets
train_data = [x;train_data];
test_data = [x;test_data];

% Feature selection
% these are the column numbers of the most important attributes
s = [134,380,471,622,706,758,988,990,1052,1116,1225,1273,1274,1321,1322,1369,1370,1371,1377,1472,1508,1519,1556,1569,1649,1690,1726,1745,1746,1849,1850,1866,1886,2066, 2305];


% select important features
train_data = train_data(:,s);
test_data = test_data(:,s);

% save datasets
csvwrite('train01.csv', train_data);
csvwrite('test01.csv', test_data);


% prepare other datasets
% move 30%  and 70% of train to test
[i1, i2,~] = dividerand(size(t3,1), 0.33,0.33, 0.33);
t30 = t3(i1,:); % 30 %
t70 = t3([i1,i2],:); % 70%
t30 = [t30; t4];
t70 = [t70; t4];

x=1:2305;
t30 = [x;t30];
t70 = [x;t70];


t30 = t30(:,s);
t70 = t70(:,s);

% store the datasets
csvwrite('test30.csv', t30);
csvwrite('test70.csv', t70);



