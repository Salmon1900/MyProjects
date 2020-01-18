%[Population,AveragedFitness,PeakFitness,FinalGeneration, Fitness] =
%RunGeneticAlgorithm(InitPopulation,Pc,Pm,PercentElite,MaxGenerations,MaxFitness);

% This function runs a genetic algorithm.

% שלב ראשון - אתחלו את הגדלים בהם תשתמשו בהמשך, על מנת שהקוד ירוץ ביעילות:
% הגדירו את המשתנים AveragedFitness ו-PeakFitness כוקטורים של אפסים באורך
% מספר הדורות המקסימלי

% YOUR CODE
AveragedFitness=zeros(1,MaxGenerations);
PeakFitness=zeros(1,MaxGenerations);
% שלב שני - הגדירו את האוכלוסיה בתור האוכלוסיה ההתחלתית
% בנוסף, קיראו לפונקציה של אוכלוסיה זו באמצעות קריאה לפונקציה
% CalculateFitness
% חשבו את הפיטנס הממוצע והמקסימלי, ושימו אותם בוקטורים המתאימים.
% YOUR CODE
Population=InitPopulation;
Fitness=CalculateFitness10(Population);
AveragedFitness(1)=mean(Fitness);
PeakFitness(1)=max(Fitness);
% שלב שלישי - אתחלו עוד שלושה גדלים שימושיים:
% 1) אינדקס הדורות
% 2)מספר הפרטים המועברים בכל דור כפרטי אליטה
% 3) הפיטנס המקסימלי הנוכחי באוכלוסיה (במשתנה נפרד מאשר בוקטור הפיטנס
% המקסימלי)

% YOUR CODE
j=1;
MFitness=max(Fitness);
% שלב רביעי - פיתחו לולאת while שתרוץ כל עוד לא הגעתם למספר הדורות
% המקסימליc
% או  לפיטנס המקסימלי
% (השתמשו בגודל שהגדרתם בסעיף הקודם)

% בתוך הלולאה:
% הגדירו מטריצה של אפסים בגודל של אוכלוסיה (מטריצה זו תהפוך לאוכלוסית הדור
% הבא)

% 2) העבירו את צאצאי האליטה לדור הבא. לשם כך עליכם לסדר באמצעות הפקודה sort
% את הפיטנס של האוכלוסיה מהדור הקודם, ולהעביר את המספר הרצוי של הצאצאים עם
% הפיטנס הגבוה ביותר

% היעזרו בדף העזר של הפונקציות ע"מ להבין איך להשתמש בפקודה sort.
   % 3) פיתחו לולאת for שבה תקראו לפונקציה CreateNewIndividual ותשלימו את
   % הפרטים הנוספים באוכלוסיה.
   % 4) חשבו את הפיטנס של האוכלוסיה החדשה שיצרתם

   % 5) חשבו את הפיטנס הממוצע והמקסימלי והכניסו אותם לוקטורים המתאימים.
    % calculate the fitness of the current generation
    % 6) עדכנו את המשתנים המחזיקים את גדלי הפיטנס המקסימלי ואת אינדקס
    % הדורות
    % 7) סיגרו את לולאת ה-while
    
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
    % שלב חמישי - 
    % 1) הגדירו את המשתנה FinalGeneration
    % 2) קצצו את גדלי המשתנים Population, Fitness, AveragedFitness,
    % PeakFitness בהתאם לדור שהגעתם אליו
    
    % YOUR CODE
    FinalGeneration=Population;
    AveragedFitness=AveragedFitness(1:j);
    PeakFitness=PeakFitness(1:j);
    % שלב שישי - 
    % ציירו בגרף את הפיטנס הממוצע והמקסימלי.
    % השתמשו בפקודות figure, plot, ,legend, xlabel, ylabel

    % YOUR CODE
%     plot((1:j),AveragedFitness,(1:j),PeakFitness,xlabel('Generations'),ylabel('Fitness'))
    plot(1:j,AveragedFitness);
    hold all
    plot(1:j,PeakFitness);
    title('Fitness progression in relation to generations')
    xlabel('Generations');
    ylabel('Averaged Fitness,Peak Fitness');
    legend('Averaged Fitness','Peak Fitness');
