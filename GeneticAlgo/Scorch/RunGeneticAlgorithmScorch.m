function[Population,AveragedFitness,PeakFitness,FinalGeneration, Fitness, OriginalFitness, BestChromosomes] = RunGeneticAlgorithmScorch(InitPopulation,Pc,Pm,PercentElite,MaxGenerations,MaxFitness,Lambda);

% This function runs a genetic algorithm.

AveragedFitness=zeros(1,MaxGenerations);
PeakFitness=zeros(1,MaxGenerations);
AvgOriginalFitness=zeros(1,MaxGenerations);
MinOriginalFitness=zeros(1,MaxGenerations);

Population=InitPopulation;
[Fitness,OriginalFitness]=CalculateFitnessScorch(Population,Lambda);
AvgOriginalFitness(1)=mean(OriginalFitness);
MinOriginalFitness(1)=min(OriginalFitness);
AveragedFitness(1)=mean(Fitness);
PeakFitness(1)=max(Fitness);
Populations{1}=Population;
BestChrom=find(Fitness==PeakFitness(1));
BestChromosomes(:,1)=Population(:,BestChrom(1));
j=1;

    while (j<MaxGenerations & MaxFitness>PeakFitness)
        NewPopulation=zeros(size(Population,1),size(Population,2));
        [Sorted,I]=sort(Fitness,'descend');
        NI=I(1:(round(length(I)*(PercentElite/100))));
        NewPopulation(:,1:length(NI))=Population(:,NI);
        for k=(length(NI)+1):(size(Population,2))
            NewPopulation(:,k)=CreateNewIndividual(Population,Fitness,Pc,Pm);
        end
        Population=NewPopulation;
        bbb=666;
        j=j+1
        [Fitness,OriginalFitness]=CalculateFitnessScorch(Population,Lambda);
        AvgOriginalFitness(1)=mean(OriginalFitness);
        MinOriginalFitness(1)=min(OriginalFitness);
        PeakFitness(j)=max(Fitness);
        AveragedFitness(j)=mean(Fitness);
        BestChrom=find(Fitness==PeakFitness(j));
        BestChromosomes(:,j)=Population(:,BestChrom(1));
        Populations{1,j}=Population;
    end
% Deleting unwanted cells
    FinalGeneration=Population;
    AveragedFitness=AveragedFitness(1:j);
    PeakFitness=PeakFitness(1:j);
    AvgOriginalFitness=AvgOriginalFitness(1:j);
    MinOriginalFitness=MinOriginalFitness(1:j);

% Presentation
    figure
    hold off
    plot(1:j,AveragedFitness);
    hold all
    plot(1:j,PeakFitness);
    title('Fitness progression in relation to generations');
    xlabel('Generations');
    ylabel('Avraged Fitness,Peak Fitness');
    legend('Averaged Fitness','Peak Fitness');
    figure
    hold all
    plot(1:j,AvgOriginalFitness);
    plot(1:j,MinOriginalFitness);
    title('Original Fitness progression in relation to generations')
    xlabel('Generations');
    ylabel('Averaged Original,Minimum Original');
    legend('Averaged Original','Minimum Original');