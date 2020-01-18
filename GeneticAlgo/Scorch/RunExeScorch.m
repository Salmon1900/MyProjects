InitPopulation=zeros(2,20);
InitPopulation(1,:)=-1.+randi(181,1,20);
InitPopulation(2,:)=-1.+randi(1000,1,20);
PercentElite=10;
Pc=80;
Pm=50;
MaxGenerations=30;
MaxFitness=1;
Lambda=3;
Populations=cell(1,30);
load('PermanentConditionsForFitness.mat');
[Population,AveragedFitness,PeakFitness,FinalGeneration, Fitness, OriginalFitness, BestChromosomes] = RunGeneticAlgorithmScorch(InitPopulation,Pc,Pm,PercentElite,MaxGenerations,MaxFitness,Lambda);

scorchReducedGamePermanentConditions_GA(BestChromosomes)