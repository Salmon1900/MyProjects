
			
function Fitness = CalculateFitness_BackPack(Population);
% חשבו כמה אחדות יש לכל פרט (פרט הוא וקטור עמודה), באמצעות הפונקציה sum
% אין צורך בלולאה - sum מקבלת מטריצה ומוציאה וקטור שהוא הסכום של כל עמודה.
load('ValueWeights (1).mat')
% לחלופין - חשבו את הפיטנס של בעיית התרמיל
% YOUR CODE
sizePop=size(Population);
Fitness=zeros(1,sizePop(2));
for k=1:sizePop(2)
    sumW=0;
    sumV=0;
    for z=1:sizePop(1)
        if(Population(z,k)==1)
            sumW=sumW+Weights(z);
            sumV=sumV+Value(z);
        end
    end
    if(sumW>40)
        sumV=0;
    end
    Fitness(k)=sumV;
end

            
        