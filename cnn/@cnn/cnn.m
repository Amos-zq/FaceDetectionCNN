function cnet = cnn( Layers, Epochs )
%CNN Summary of this function goes here
%   Detailed explanation goes here

cnet.epochs = Epochs;
cnet.LayersNum = Layers;
cnet.Ip{1} = 1;

cnet.theta = 0.05;
cnet.theta_dec = 0.5;

for it = 1:cnet.LayersNum
    cnet.Layer{it}.type = 's';
    
    
    cnet.Layer{it}.InputHeight = 2;
    cnet.Layer{it}.InputWidth = 2;
    cnet.Layer{it}.TransferFunction = 'purelin';
    
    cnet.Layer{it}.FMapNum = 1;
    cnet.Layer{it}.ConMap = 1;
    
    cnet.Layer{it}.W = 1;
    cnet.Layer{it}.B = 0;
    
    cnet.Layer{it}.Y{1} = 0; % Wa�one wej�cie
    cnet.Layer{it}.X{1} = 0; % Wyj�cie po funkcji aktywacji
    
    cnet.Layer{it}.dEdW{1} = 0; % Pochodna cz�stkowa b��du po wagach
    cnet.Layer{it}.dEdB{1} = 0; % Pochodna cz�stkowa b��du po biasach
    cnet.Layer{it}.dEdX{1} = 0; % Pochodna cz�stkowa b��du po wyj�cu
    cnet.Layer{it}.dXdY{1} = 0; % Pochodna cz�stkowa wyj�cia po wa�onym wej�ciu
    cnet.Layer{it}.dYdW{1} = 0; % Pochodna cz�stkowa wa�onego wej�cia po wagach
    cnet.Layer{it}.dYdB{1} = 0; % Pochodna cz�stkowa wa�onego wej�cia po biasach
    
end

cnet = class(cnet, 'cnn');
end

