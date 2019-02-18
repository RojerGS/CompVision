function [imOut] = imageDerivatives(img, sigma, type)
%imageDerivatives returns a derivative of the image, where type
% can be any of x, y, xx, yy, xy, yx
    bound = ceil(3*sigma);
    xs = [-bound:bound];
    expr = @ (x) ((1/(sigma*sqrt(2*pi)))*exp(-x.^2/(2*sigma^2)));
    kernel = expr(xs);
    kernel = kernel/sum(kernel); % normalize
    
    dkernel = -xs.*kernel/sigma^2;
    
    ddkernel = ((-sigma^2 + xs.^2)/(sigma^4)).*kernel;
    
    switch length(type)
        case 1
            % type x or y
            if type == 'x'
                imOut = conv2([1], dkernel, img);
            elseif type == 'y'
               	imOut = conv2(dkernel, [1], img);
            end
        case 2
            if type(1) ~= type(2)
                % type xy or yx
                imOut = imageDerivatives(...
                            imageDerivatives(img, sigma, type(2)),...
                        sigma, type(1));
            else
                % type xx or yy
                if type == 'xx'
                    kx = ddkernel;
                    ky = [1];
                elseif type == 'yy'
                    kx = [1];
                    ky = ddkernel;
                end
            imOut = conv2(ky, kx, img);
            end
        otherwise
            fprintf('Cant handle the type <%s>\n', type);
    end
end

