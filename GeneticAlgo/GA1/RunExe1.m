InitPopulation=zeros(25,100);
for i=1:100
    for c=1:25
        if(rand()<0.1)
          InitPopulation(c,i)=1;
        end
    end
end
Pc=70;
Pm=0.1;
PercentElite=10;
MaxGenerations=1000;
MaxFitness=20;
RunGeneticAlgorithm