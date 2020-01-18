function NewIndividual = CreateNewIndividual(Population,Fitness,Pc,Pm);
% הפונקציה הזו מקבלת את האוכלוסיה ואת הציונים של כל פרט באוכלוסיה, וע"י
% חוקי האלגוריתם הגנטי מוציאה פרט אחד חדש.

% שלב ראשון - ביחרו שני הורים עפ"י שיטת הרולטה (קיראו לפונקציה Roullette)
% קיראו לפונקציה פעמיים - כל פעם ע"מ ליצור הורה אחר

% YOUR CODE
Dad=Roullette(Population,Fitness);
Mom=Roullette(Population,Fitness);

% שלב שני - בצעו קרוס-אובר בין שני ההורים וצרו שני צאצאים חדשים (קראו
% לפונקציה CrossOver המקבלת שני הורים והסתברות לקרוסאובר ומוציאה שני
% צאצאים)

% YOUR CODE
[New1, New2]=CrossOver(Dad,Mom,Pc);

% שלב שלישי - 
% מתוך שני הצאצאים שיצרתם, ביחרו אקראית אחד מהם והוסיפו לו מוטציות.

% איך בוחרים אקראית: מגרילים מספר אקראי בין 0 ל1- באמצעות הפונקציה rand. אם
% המספר שיצא גדול מ0.5- בוחרים את הצאצא הראשון, אם הוא קטן מ0.5- בוחרים את
% הצאצא השני.

% איך מוסיפים מוטציות?  קוראים לפונקציה AddMutations, המקבלת פרט והסתברות
% למוטציה בכל ביט ומוסיפה את המוטציות.

% התוצאה של הפונקציה תהיה הפרט החדש - NewIndividual

% YOUR CODE
r=rand();
if(r<0.5)
    NewIndividual=AddMutations(New1,Pm);
else
    NewIndividual=AddMutations(New2,Pm);
end