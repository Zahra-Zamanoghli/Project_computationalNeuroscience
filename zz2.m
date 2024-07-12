clear all
close all
clc

%% بارگذاری داده ها و انجام محاسبات
for celli = 1:5
    data{celli} = load(['Cell' num2str(celli) '.mat']);
    
    spikes{celli} = data{celli}.mtdata.spkt{1};
    spike_counts{celli} = data{celli}.mtdata.spkbinned;
    duration = data{celli}.mtdata.dt / 1000; % تبدیل به ثانیه
    
    %% رسم Raster Plot
    figure;
    hold on;
    for j = 1:length(spikes{celli})
        plot([spikes{celli}(j), spikes{celli}(j)], [0.8, 1.2], 'k');
    end
    xlabel('Time (ms)');
    ylabel('Spikes');
    title(['Raster Plot - Cell ' num2str(celli)]);
    hold off;
    
    %% رسم firing rate plot
    figure;
    hold on;
    
    firing_rates = spike_counts{celli} / duration;
    plot(firing_rates, 'b');
    
    xlabel('Time Bin');
    ylabel('Firing Rate (spikes/s)');
    title(['Firing Rate Plot - Cell ' num2str(celli)]);
    hold off;
    
    %% محاسبه Fano factor و ضریب همبستگی
    
    % محاسبه Fano factor
    fano_factor(celli) = var(spike_counts{celli}) / mean(spike_counts{celli});
    
    % محاسبه ضریب همبستگی (CV)
    cv(celli) = std(firing_rates) / mean(firing_rates);
    
    fprintf('Cell %d:\n', celli);
    fprintf('Fano Factor: %.4f\n', fano_factor(celli));
    fprintf('Coefficient of Variation: %.4f\n', cv(celli));
end

%% نمایش نتایج
figure;
subplot(2,1,1);
bar(fano_factor);
title('Fano Factor');
xlabel('Cell');
ylabel('Fano Factor');

subplot(2,1,2);
bar(cv);
title('Coefficient of Variation');
xlabel('Cell');
ylabel('CV');