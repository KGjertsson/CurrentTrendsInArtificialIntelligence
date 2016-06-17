function Net = scalefree(N)
seed =[0 1 0 0 1;1 0 0 1 0;0 0 0 1 0;0 1 1 0 0;1 0 0 0 0];
Net = SFNG(N, 1, seed);
% PL_Equation = PLplot(Net);
% CNet(Net);

% count = 1;
%
% % for each row
% for i = 1:N
%
%     % for each element (column) in row i
%     for j = 1:N
%         if Net(i,j) == 1
%             edges(count,:) = [i,j];
%             count = count + 1;
%         end
%     end
% end
end

