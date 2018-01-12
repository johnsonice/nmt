## nmt example

bash nmt/scripts/download_iwslt15.sh ./tmp/nmt_data
mkdir ./tmp/nmt_model
python -m nmt.nmt \
    --src=vi --tgt=en \
    --vocab_prefix=./tmp/nmt_data/vocab  \
    --train_prefix=./tmp/nmt_data/train \
    --dev_prefix=./tmp/nmt_data/tst2012  \
    --test_prefix=./tmp/nmt_data/tst2013 \
    --out_dir=./tmp/nmt_model \
    --num_train_steps=12000 \
    --steps_per_stats=100 \
    --num_layers=2 \
    --num_units=128 \
    --dropout=0.2 \
    --metrics=bleu

## chatbot example 
mkdir ./tmp/nmt_model
python -m nmt.nmt \
    --attention=scaled_luong \
    --src=enc --tgt=dec \
    --vocab_prefix=./tmp/nmt_data/chatbot/vocab  \
    --train_prefix=./tmp/nmt_data/chatbot/train \
    --dev_prefix=./tmp/nmt_data/chatbot/dev  \
    --test_prefix=./tmp/nmt_data/chatbot/test \
    --out_dir=./tmp/nmt_model \
    --num_train_steps=1200000 \
    --steps_per_stats=100 \
    --num_layers=4 \
    --num_units=256 \
    --dropout=0.2 \
    --metrics=bleu