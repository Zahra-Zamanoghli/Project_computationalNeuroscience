clear all
close all
clc
%%
% بارگذاری داده ها
    
  load(['Cell1.mat']);

%% رسم رستر پلات


num_trials = length(mtdata.spkt{1, 1});
spikes = mtdata.spkt{1, 1};

%%

figure;
hold on;

    for j = 1:num_trials
        plot([spikes(j), spikes(j)], [1.8, 2.2], 'r');
    end

xlabel('Time (ms)');
ylabel('Trial');
title('Raster Plot');
hold off;

%% رسم firing rate plot
figure;
hold on;
duration = 0.025; % مدت زمان ارائه هر محرک (در ثانیه)

firing_rates = mtdata.spkbinned / duration;
plot(firing_rates, 'b');

xlabel('Time (ms)');
ylabel('Firing Rate (spikes/s)');
title('Firing Rate Plot');
hold off;

%% محاسبه Fano factor و ضریب همبستگی
spike_counts = mtdata.spkbinned;
firing_rates = spike_counts / duration;

% محاسبه Fano factor
fano_factor = var(spike_counts) / mean(spike_counts);

% محاسبه ضریب همبستگی (CV)
cv = std(firing_rates) / mean(firing_rates);

fprintf('Mean Fano Factor: %.4f\n', fano_factor);
fprintf('Mean Coefficient of Variation: %.4f\n', cv);
