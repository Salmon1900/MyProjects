
			
function Fitness = CalculateFitness10(Population);
% חשבו כמה אחדות יש לכל פרט (פרט הוא וקטור עמודה), באמצעות הפונקציה sum
% אין צורך בלולאה - sum מקבלת מטריצה ומוציאה וקטור שהוא הסכום של כל עמודה.

% לחלופין - חשבו את הפיטנס של בעיית התרמיל
% YOUR CODE
Fitness=sum(Population);