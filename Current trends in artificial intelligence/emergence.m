for count = 1:1
    disp(count);
    N = 100;
    k = 4;
    kN = k * N;
    nbrsim = 10000;
    
    h = WattsStrogatz(N,k,0.1);
    deg = degree(h);
    
    representations = simulation(h,N,k,nbrsim, height(h.Edges));
    
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
    title('Watts-Strogatz Graph with $N = 100$ nodes, $K = 4$, and $\beta = 0.1$', ...
        'Interpreter','latex');
    print(strcat('WattsStrogartzPreferencePlot',int2str(count)),'-dpng');
    
    % plot the conviction graph
    figure('Visible', 'off');
    colormap gray
    plot(h,'NodeCData',convictions,'Layout','circle');
    title('Watts-Strogatz Graph with $N = 100$ nodes, $K = 4$, and $\beta = 0.1$', ...
        'Interpreter','latex');
    print(strcat('WattsStrogartzConvictionPlot',int2str(count)),'-dpng');
    
    % plot a histogram showing which actions are more common than the others
    figure('Visible', 'off');
    histo = histogram(deg);
    print(strcat('WattsStrogartzHistogram',int2str(count)),'-dpng');
    
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
    title('Watts-Strogatz Graph with $N = 100$ nodes, $K = 4$, and $\beta = 0.1$', ...
        'Interpreter','latex');
    print(strcat('WattsStrogartzPreferencePlotPertubationBeforeSimulation',int2str(count)),'-dpng');
    
    % plot the new conviction graph before the simulation
    figure('Visible', 'off');
    colormap gray
    plot(h,'NodeCData',convictions,'Layout','circle');
    title('Watts-Strogatz Graph with $N = 100$ nodes, $K = 4$, and $\beta = 0.1$', ...
        'Interpreter','latex');
    print(strcat('WattsStrogartzConvictionPlotPertubationBeforeSimulation',int2str(count)),'-dpng');
    
    % plot a new histogram showing which actions are more common than the others
    figure('Visible', 'off');
    histo = histogram(deg);
    print(strcat('WattsStrogartzHistogramPertubationBeforeSimulation',int2str(count)),'-dpng');
    
    % repeat the simulation with the new 'students'
    representations = simulation(h,N,k,nbrsim, height(h.Edges));
    
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
    title('Watts-Strogatz Graph with $N = 100$ nodes, $K = 4$, and $\beta = 0.1$', ...
        'Interpreter','latex');
    print(strcat('WattsStrogartzPreferencePlotPertubationAfterSimulation',int2str(count)),'-dpng');
    
    % plot the new conviction graph after the simulation
    figure('Visible', 'off');
    colormap gray
    plot(h,'NodeCData',convictions,'Layout','circle');
    title('Watts-Strogatz Graph with $N = 100$ nodes, $K = 4$, and $\beta = 0.1$', ...
        'Interpreter','latex');
    print(strcat('WattsStrogartzConvictionPlotAfterBeforeSimulation',int2str(count)),'-dpng');
    
    % plot a new histogram showing which actions are more common than the
    % others after the simulation
    figure('Visible', 'off');
    histo = histogram(deg);
    print(strcat('WattsStrogartzHistogramPertubationAfterSimulation',int2str(count)),'-dpng');
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%% redo experiment with scalefree network %%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    sf = graph(scalefree(N));
    representations = simulation(sf,N,k,nbrsim, height(sf.Edges));
    
    % check which 'agents' prefer which action
    for i = 1:N
        rep = representations(i,:);
        index = findLargestIndex(rep);
        deg(i) = index;
        
        convictions(i) = max(rep) / sum(rep);
    end
    
    % plot the circle figure for the scale-free network
    figure('Visible', 'off');
    plot(sf,'NodeCData',deg,'Layout','circle');
    title('Scale-Free Graph with $N = 100$ nodes', ...
        'Interpreter','latex');
    print(strcat('ScaleFreePreferencePlot',int2str(count)),'-dpng');
    
    % plot the conviction graph for the scale-free network
    figure('Visible', 'off');
    colormap gray
    plot(sf,'NodeCData',convictions,'Layout','circle');
    title('Scale-Free Graph with $N = 100$ nodes', ...
        'Interpreter','latex');
    print(strcat('ScaleFreeConvictionPlot',int2str(count)),'-dpng');
    
    % plot a histogram showing for the scale-free network which actions
    % are more common than the others
    figure('Visible', 'off');
    histo = histogram(deg);
    print(strcat('Scale-FreeHistogram',int2str(count)),'-dpng');
    
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
    
    % plot the circle figure for the scale-free network
    figure('Visible', 'off');
    plot(sf,'NodeCData',deg,'Layout','circle');
    title('Scale-Free Graph with $N = 100$ nodes', ...
        'Interpreter','latex');
    print(strcat('ScaleFreePreferencePlotPertubationBeforeSimulation',int2str(count)),'-dpng');
    
    % plot the conviction graph for the scale-free network
    figure('Visible', 'off');
    colormap gray
    plot(sf,'NodeCData',convictions,'Layout','circle');
    title('Scale-Free Graph with $N = 100$ nodes', ...
        'Interpreter','latex');
    print(strcat('ScaleFreeConvictionPlotPertubationBeforeSimulation',int2str(count)),'-dpng');
    
    % plot a histogram showing for the scale-free network which actions
    % are more common than the others
    figure('Visible', 'off');
    histo = histogram(deg);
    print(strcat('Scale-FreeHistogramPertubationBeforeSimulation',int2str(count)),'-dpng');
    
    % repeat the simulation with the new 'students'
    representations = simulation(h,N,k,nbrsim, height(h.Edges));
    
    % recalculate which representation each agent has again
    for i = 1:N
        rep = representations(i,:);
        index = findLargestIndex(rep);
        deg(i) = index;
        
        convictions(i) = max(rep) / sum(rep);
    end
    
    % plot the circle figure for the scale-free network
    figure('Visible', 'off');
    plot(sf,'NodeCData',deg,'Layout','circle');
    title('Scale-Free Graph with $N = 100$ nodes', ...
        'Interpreter','latex');
    print(strcat('ScaleFreePreferencePlotPertubationAfterSimulation',int2str(count)),'-dpng');
    
    % plot the conviction graph for the scale-free network
    figure('Visible', 'off');
    colormap gray
    plot(sf,'NodeCData',convictions,'Layout','circle');
    title('Scale-Free Graph with $N = 100$ nodes', ...
        'Interpreter','latex');
    print(strcat('ScaleFreeConvictionPlotPertubationAfterSimulation',int2str(count)),'-dpng');
    
    % plot a histogram showing for the scale-free network which actions
    % are more common than the others
    figure('Visible', 'off');
    histo = histogram(deg);
    print(strcat('Scale-FreeHistogramPertubationAfterSimulation',int2str(count)),'-dpng');
    
end
