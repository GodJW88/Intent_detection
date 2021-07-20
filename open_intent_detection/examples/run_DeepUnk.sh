#!/usr/bin bash
method='DeepUnk'
results_file_name="$method-"`date "+%Y-%m-%d-%H-%M-%S".csv`

for dataset in 'banking' 'oos' 'stackoverflow'
do
    for known_cls_ratio in 0.25 0.5 0.75
    do
        for labeled_ratio in 1.0
        do 
            for seed in 0 1 2 3 4 5 6 7 8 9 
            do
                python run.py \
                --dataset $dataset \
                --method 'DeepUnk' \
                --known_cls_ratio $known_cls_ratio \
                --labeled_ratio $labeled_ratio \
                --seed $seed \
                --num_train_epochs 100 \
                --backbone 'bert_deepunk' \
                --config_file_name 'DeepUnk' \
                --gpu_id '1' \
                --train \
                --save_results \
                --results_file_name 'results_DeepUnk.csv' \
                --save_model 
            done
        done
    done
done