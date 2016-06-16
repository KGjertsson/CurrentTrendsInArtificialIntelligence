function representations = simulation(h,N,k,iter)
kN = k * N;
edges = h.Edges;
representations = randi([0 10],N,k);

% run the simulation for 'iter' number of iterations
for i = 1:iter
    disp(i);
    
    % find the highest representation for each node, the first index in the
    % list of edges is seen as the index that has the representations given
    % in the first index in the representation matrix
    for j = 1:N
        current = representations(j,:);
        rep = findLargestIndex(current);
        reps(j,:) = rep;
    end
    % We have now found the highest representation for each node, time to
    % 'play' the actions. Worth noting is that each representation is coded
    % as the different columns in the representation matrix.
    for j = 1:kN
        currentEdge = edges(j,:);
        currentNode = currentEdge.EndNodes(1);
        currentNeighbour = currentEdge.EndNodes(2);
        currentRep = reps(currentNeighbour);
        representations(currentNode,currentRep) = representations(currentNode,currentRep) + 1;
        
        currentRep = reps(currentNode);
        representations(currentNeighbour,currentRep) = representations(currentNeighbour,currentRep) + 1;
    end
end

for j = 1:N
    current = representations(j,:);
    rep = findLargestIndex(current);
    reps(j,:) = rep;
end
end