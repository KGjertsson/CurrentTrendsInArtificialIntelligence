function index = findLargestIndex(row)
k = length(row);
index = 0;
max = -1;
for j = 1:k
    if row(j) > max
        index = j;
        max = row(j);
        % if the new element has the same representational
        % weight then random between 1 and 2, if the result is
        % one replace max with the new one
    elseif row(j) == max
        rand = randi([1 2],1,1);
        if rand == 1
            max = row(j);
            index = j;
            % else: do nothing i.e. keep the old value
        end
    end
end
end

