for count = 1:1
    disp(count);
    N = 100;
    k = 4;
    kN = k * N;
    
    h = WattsStrogatz(N,k,0.1);
    deg = degree(h);
    
    representations = simulation(h,N,k,100);
    
    % check which 'agents' prefer which action
    for i = 1:N
        rep = representations(i,:);
        index = findLargestIndex(rep);
        deg(i) = index;
        
        convictions(i) = max(rep) / sum(rep);
    end
    
    
    % plot the circle figure
    figure('Visible', 'off');
    plot(h,'NodeCData',deg,'Layout','circle');
    title('Watts-Strogatz Graph with $N = 100$ nodes, $K = 4$, and $\beta = 1.0$', ...
        'Interpreter','latex');
    print(strcat('PreferencePlot',int2str(count)),'-dpng');
    
    % plot the conviction graph
    figure('Visible', 'off');
    colormap gray
    plot(h,'NodeCData',convictions,'Layout','circle');
    title('Watts-Strogatz Graph with $N = 100$ nodes, $K = 4$, and $\beta = 1.0$', ...
        'Interpreter','latex');
    print(strcat('ConvictionPlot',int2str(count)),'-dpng');
    
    % plot a histogram showing which actions are more common than the others
    figure('Visible', 'off');
    histo = histogram(deg);
    print(strcat('Histogram',int2str(count)),'-dpng');
    
    % add new nodes
    newPop = N / 5;
    randomIndices = randperm(N,newPop);
    for i = 1:newPop
        representations(randomIndices(i),:) = randi([0 10],1,k);
    end
    
    % recalculate which representation the agents choose
    for i = 1:N
        rep = representations(i,:);
        index = findLargestIndex(rep);
        deg(i) = index;
        
        convictions(i) = max(rep) / sum(rep);
    end
    
    % plot the new figure before simulation
    figure('Visible', 'off');
    plot(h,'NodeCData',deg,'Layout','circle');
    title('Watts-Strogatz Graph with $N = 100$ nodes, $K = 4$, and $\beta = 1.0$', ...
        'Interpreter','latex');
    print(strcat('PreferencePlotPertubationBeforeSimulation',int2str(count)),'-dpng');
    
    % plot the new conviction graph before the simulation
    figure('Visible', 'off');
    colormap gray
    plot(h,'NodeCData',convictions,'Layout','circle');
    title('Watts-Strogatz Graph with $N = 100$ nodes, $K = 4$, and $\beta = 1.0$', ...
        'Interpreter','latex');
    print(strcat('ConvictionPlotPertubationBeforeSimulation',int2str(count)),'-dpng');
    
    % plot a new histogram showing which actions are more common than the others
    figure('Visible', 'off');
    histo = histogram(deg);
    print(strcat('HistogramPertubationBeforeSimulation',int2str(count)),'-dpng');
    
    % repeat the simulation with the new 'students'
    representations = simulation(h,N,k,100);
    
    % recalculate which representation each agent has again
    for i = 1:N
        rep = representations(i,:);
        index = findLargestIndex(rep);
        deg(i) = index;
        
        convictions(i) = max(rep) / sum(rep);
    end
    
    % plot the new figure after simulation
    figure('Visible', 'off');
    plot(h,'NodeCData',deg,'Layout','circle');
    title('Watts-Strogatz Graph with $N = 100$ nodes, $K = 4$, and $\beta = 1.0$', ...
        'Interpreter','latex');
    print(strcat('PreferencePlotPertubationAfterSimulation',int2str(count)),'-dpng');
    
    % plot the new conviction graph after the simulation
    figure('Visible', 'off');
    colormap gray
    plot(h,'NodeCData',convictions,'Layout','circle');
    title('Watts-Strogatz Graph with $N = 100$ nodes, $K = 4$, and $\beta = 1.0$', ...
        'Interpreter','latex');
    print(strcat('ConvictionPlotAfterBeforeSimulation',int2str(count)),'-dpng');
    
    % plot a new histogram showing which actions are more common than the
    % others after the simulation
    figure('Visible', 'off');
    histo = histogram(deg);
    print(strcat('HistogramPertubationAfterSimulation',int2str(count)),'-dpng');
    
end
