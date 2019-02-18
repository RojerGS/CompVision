imgPath = 'zebra.png';
img = imread(imgPath);
if length(size(img)) > 2
    img = img(:,:,1);
end
imshow(img);

sigmas = [0.3, 1, 3, 10];
edge_ts = 0.3;

for sigma = sigmas
    [magnitude, orientation] = gradmag(img, sigma);

    figure();
    imshow(orientation, [-pi, pi]);
    colormap(hsv);
    colorbar;
    title(sprintf('sigma = %f', sigma));

    figure();
    imshow(magnitude/max(magnitude(:)));
    title(sprintf('magnitude, sigma = %f', sigma));
    
    figure();
    edges = zeros(size(magnitude));
    edges(magnitude/max(magnitude(:)) > edge_ts) = 1;
    imshow(edges);
    title(sprintf('edges, sigma = %f', sigma));
end