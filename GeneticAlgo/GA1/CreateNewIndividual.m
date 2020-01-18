function NewIndividual = CreateNewIndividual(Population,Fitness,Pc,Pm);
% �������� ��� ����� �� ��������� ��� ������� �� �� ��� ���������, ��"�
% ���� ��������� ����� ������ ��� ��� ���.

% ��� ����� - ����� ��� ����� ��"� ���� ������ (����� �������� Roullette)
% ����� �������� ������ - �� ��� �"� ����� ���� ���

% YOUR CODE
Dad=Roullette(Population,Fitness);
Mom=Roullette(Population,Fitness);

% ��� ��� - ���� ����-���� ��� ��� ������ ���� ��� ������ ����� (����
% �������� CrossOver ������ ��� ����� �������� ��������� ������� ���
% ������)

% YOUR CODE
[New1, New2]=CrossOver(Dad,Mom,Pc);

% ��� ����� - 
% ���� ��� ������� ������, ����� ������ ��� ��� ������� �� �������.

% ��� ������ ������: ������� ���� ����� ��� 0 �1- ������� �������� rand. ��
% ����� ���� ���� �0.5- ������ �� ����� ������, �� ��� ��� �0.5- ������ ��
% ����� ����.

% ��� ������� �������?  ������ �������� AddMutations, ������ ��� ��������
% ������� ��� ��� ������� �� ��������.

% ������ �� �������� ���� ���� ���� - NewIndividual

% YOUR CODE
r=rand();
if(r<0.5)
    NewIndividual=AddMutations(New1,Pm);
else
    NewIndividual=AddMutations(New2,Pm);
end