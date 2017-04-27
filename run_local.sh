export DEFAULT_NTHREADS=5
build/difacto local.conf data_in=data/train_data data_val=data/train_data learner=sgd  V_dim=4 max_num_epochs=2 batch_size=1000 has_aux=1 field_num=18
