function y = my_fitness(population)
% population�������[0,1]��������Ĳ����ı䷶ΧΪ[-1,1]
population = 2 * (population - 0.5); 
y = sum(population.^2, 2); % �е�ƽ����
