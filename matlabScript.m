filename = 'vid01-frames.csv';
data = readtable(filename);


% Extract data (modify column indices as needed)
time = data{:, 1};
size = data{:, 2};
type = data{:, 3};


keyframe_time = time(type == "I");  % Time for keyframes
keyframe_bitrate = size(type == "I");  % Bitrate for keyframes

for i = 1:length(keyframe_bitrate)
    fprintf('I frame %d at %.3f seconds: Bitrate = %.0f bytes\n', ...
        i, keyframe_time(i), keyframe_bitrate(i));
end

figure;
plot(keyframe_time, keyframe_bitrate, 'o-', 'LineWidth', 1, 'MarkerSize', 6, 'Color', 'b');
xlabel('Time (seconds)');
ylabel('Bitrate (bytes)');
title('Bitrate of I-frames Over Time');
grid on;

for i = 1:length(keyframe_time)
    % Draw vertical line at each keyframe time
    line([keyframe_time(i), keyframe_time(i)], ylim, 'Color', 'r', 'LineStyle', '--', 'LineWidth', 1);
end
