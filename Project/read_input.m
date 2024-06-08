function [Xo, Yo, Zo, Umag0, theta, phi, omgX, omgY, omgZ] = read_input( inputfile, shot_num)
% read_input retrieves the input conditions for a theoretical shot
% INPUT
% - inputfile: the file to retreive the data from (should be .txt)
% - shot_num: the nuber of shot to rereive
% 
% OUTPUT
% - Xo : the starting x position of the ball
% - Yo : the starting Y position of the ball
% - Zo : the starting Z position of the ball
% - Umag0 : the magnitude of the initial velocity of the ball
% - theta : the angle in the XY plane
% - phi   : the angle in the z direction
% - omgX : the starting angular velocity in about the x axis
% - omgY : the starting angular velocity in about the y axis
% - omgZ : the starting angular velocity in about the Z axis

    import = importdata(inputfile);
    shots = import.data;

    shotNumbers = shots(:, 1);
    shotIndex =  shotNumbers == shot_num;

    if sum(shotIndex) == 0
    disp( "[ERROR] no Shot for shot_num: " + shot_num );

    Xo = NaN;
    Yo = NaN;
    Zo = NaN;

    Umag0 = NaN;
    theta = NaN;
    phi = NaN;

    omgX = NaN;
    omgY = NaN;
    omgZ = NaN;
    return;
    end

    shot = shots( shotIndex, 1:end );

    Xo = shot(2);
    Yo = shot(3);
    Zo = shot(4);

    Umag0 = shot(5);
    theta = shot(6);
    phi = shot(7);

    omgX = shot(8);
    omgY = shot(9);
    omgZ = shot(10);

end