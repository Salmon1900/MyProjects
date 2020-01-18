%[Population,AveragedFitness,PeakFitness,FinalGeneration, Fitness] =
%RunGeneticAlgorithm(InitPopulation,Pc,Pm,PercentElite,MaxGenerations,MaxFitness);

% This function runs a genetic algorithm.

% ��� ����� - ����� �� ������ ��� ������ �����, �� ��� ����� ���� �������:
% ������ �� ������� AveragedFitness �-PeakFitness �������� �� ����� �����
% ���� ������ ��������

% YOUR CODE
AveragedFitness=zeros(1,MaxGenerations);
PeakFitness=zeros(1,MaxGenerations);
% ��� ��� - ������ �� ��������� ���� ��������� ��������
% �����, ����� �������� �� �������� �� ������� ����� ��������
% CalculateFitness
% ���� �� ������ ������ ���������, ����� ���� �������� ��������.
% YOUR CODE
Population=InitPopulation;
Fitness=CalculateFitness10(Population);
AveragedFitness(1)=mean(Fitness);
PeakFitness(1)=max(Fitness);
% ��� ����� - ����� ��� ����� ����� ��������:
% 1) ������ ������
% 2)���� ������ �������� ��� ��� ����� �����
% 3) ������ �������� ������ ��������� (������ ���� ���� ������ ������
% ��������)

% YOUR CODE
j=1;
MFitness=max(Fitness);
% ��� ����� - ����� ����� while ����� �� ��� �� ����� ����� ������
% ��������c
% ��  ������ ��������
% (������ ����� ������� ����� �����)

% ���� ������:
% ������ ������ �� ����� ����� �� �������� (������ �� ����� ��������� ����
% ���)

% 2) ������ �� ����� ������ ���� ���. ��� �� ����� ���� ������� ������ sort
% �� ������ �� ��������� ����� �����, ������� �� ����� ����� �� ������� ��
% ������ ����� �����

% ������ ��� ���� �� ��������� �"� ����� ��� ������ ������ sort.
   % 3) ����� ����� for ��� ����� �������� CreateNewIndividual ������� ��
   % ������ ������� ���������.
   % 4) ���� �� ������ �� ��������� ����� ������

   % 5) ���� �� ������ ������ ��������� ������� ���� �������� ��������.
    % calculate the fitness of the current generation
    % 6) ����� �� ������� �������� �� ���� ������ �������� ��� ������
    % ������
    % 7) ����� �� ����� �-while
    
    % YOUR CODE
    while (j<MaxGenerations & MaxFitness>PeakFitness)
        NewPopulation=zeros(size(Population,1),size(Population,2));
        [Sorted,I]=sort(Fitness,'descend');
        NI=I(1:(round(length(I)*(PercentElite/100))));
        NewPopulation(:,1:length(NI))=Population(:,NI);
        for k=(length(NI)+1):(size(Population,2))
            NewPopulation(:,k)=CreateNewIndividual(Population,Fitness,Pc,Pm);
        end
        Population=NewPopulation;
        j=j+1;
        Fitness=CalculateFitness10(Population);
        PeakFitness(j)=max(Fitness);
        AveragedFitness(j)=mean(Fitness);
    end
    % ��� ����� - 
    % 1) ������ �� ������ FinalGeneration
    % 2) ���� �� ���� ������� Population, Fitness, AveragedFitness,
    % PeakFitness ����� ���� ������ ����
    
    % YOUR CODE
    FinalGeneration=Population;
    AveragedFitness=AveragedFitness(1:j);
    PeakFitness=PeakFitness(1:j);
    % ��� ���� - 
    % ����� ���� �� ������ ������ ���������.
    % ������ ������� figure, plot, ,legend, xlabel, ylabel

    % YOUR CODE
%     plot((1:j),AveragedFitness,(1:j),PeakFitness,xlabel('Generations'),ylabel('Fitness'))
    plot(1:j,AveragedFitness);
    hold all
    plot(1:j,PeakFitness);
    title('Fitness progression in relation to generations')
    xlabel('Generations');
    ylabel('Averaged Fitness,Peak Fitness');
    legend('Averaged Fitness','Peak Fitness');
