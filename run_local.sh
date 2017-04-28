export DEFAULT_NTHREADS=5
#build/difacto local.conf data_in=data/train_data/agaricus.txt.train data_val=data/agaricus.txt.test learner=fmsgd  V_dim=4 max_num_epochs=2 batch_size=1000 has_aux=1 l1_shrk=0
build/difacto local.conf data_in=data/train_data/bigdata.tr.txt data_val=data/bigdata.te.txt learner=ffmsgd  V_dim=4 max_num_epochs=2 batch_size=1000 has_aux=1 field_num=18
