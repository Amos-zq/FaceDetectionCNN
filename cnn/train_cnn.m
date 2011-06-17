close all;
clc;

cnet = cnn(6, 10);

cnet = setLayer(cnet, ...
                1, ... % NUmer Warstwy
                'c', ... % typ warstwy c/s/n
                5, ...  % Wysoko�� wej�cia
                5, ... % Szeroko�� wejscia
                'purelin', ... % Funkcja przej�cia
                4, ... % Ilo�� feature maps-�w
                [ 1 ; 1 ; 1 ; 1]); % Mapa po��cze� 
            

cnet = setLayer(cnet, ...
                2, ... % NUmer Warstwy
                's', ... % typ warstwy c/s/n
                2, ...  % Wysoko�� wej�cia
                2, ... % Szeroko�� wejscia
                'tansig', ... % Funkcja przej�cia
                4, ... % Ilo�� feature maps-�w
                eye(4) ); % Mapa po��cze�
            
            
            

cnet = setLayer(cnet, ...
                3, ... % NUmer Warstwy
                'c', ... % typ warstwy c/s/n
                3, ...  % Wysoko�� wej�cia
                3, ... % Szeroko�� wejscia
                'purelin', ... % Funkcja przej�cia
                14, ... % Ilo�� feature maps-�w
                [ 1 0 0 0; ...
                  1 0 0 0; ...
                  0 1 0 0; ...
                  0 1 0 0; ...
                  0 0 1 0; ...
                  0 0 1 0; ...
                  0 0 0 1; ...
                  0 0 0 1; ...
                  0 0 1 1; ...
                  0 1 1 0; ...
                  1 1 0 0; ...
                  1 0 0 1; ...                  
                  0 1 0 1; ...
                  1 0 1 0 ]); % Mapa po��cze�
              
cnet = setLayer(cnet, ...
                4, ... % Numer Warstwy
                's', ... % typ warstwy c/s/n
                2, ...  % Wysoko�� wej�cia
                2, ... % Szeroko�� wejscia
                'tansig', ... % Funkcja przej�cia
                14, ... % Ilo�� feature maps-�w
                eye(14) ); % Mapa po��cze�
            
cnet = setLayer(cnet, ...
                5, ... % NUmer Warstwy
                'n', ... % typ warstwy c/s/n
                7, ...  % Wysoko�� wej�cia
                6, ... % Szeroko�� wejscia
                'tansig', ... % Funkcja przej�cia
                14, ... % Ilo�� feature maps-�w
                eye(14) ); % Mapa po��cze�

cnet = setLayer(cnet, ...
                6, ... % NUmer Warstwy
                'n', ... % typ warstwy c/s/n
                1, ...  % Wysoko�� wej�cia
                1, ... % Szeroko�� wejscia
                'tansig', ... % Funkcja przej�cia
                1, ... % Ilo�� feature maps-�w
                ones(1, 14) ); % Mapa po��cze�

cnet = init(cnet);

%[out, cnet] = sim(cnet, double(imread('face001.jpg')));
%fprintf('out = %.3f\n', out);

%cnet = adapt(cnet, out -1);

%[out, cnet] = sim(cnet, double(imread('face001.jpg')));
%fprintf('out = %.3f\n', out);

%imshow(out);

IpG = loadImages('../faces/face_%04d.bmp', 59 ); %'../faces/face_%04d.bmp' %'../cyfry/%02d.bmp'
IpB{1} = double(zeros(36,32));

[error,cnet] = train(cnet, IpG, IpB);

plot(error);
