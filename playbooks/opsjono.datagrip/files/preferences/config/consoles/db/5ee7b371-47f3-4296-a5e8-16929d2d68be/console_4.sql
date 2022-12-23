use quaysidg_news;
# Takes about 10 minutes to add each column on staging
ALTER TABLE quaysidg_news.sales_data ADD COLUMN dtg_apps int after category, ALGORITHM=inplace, LOCK=none;
ALTER TABLE quaysidg_news.sales_data ADD COLUMN emb_apps int after dtg_apps, ALGORITHM=inplace, LOCK=none;
ALTER TABLE quaysidg_news.sales_data ADD COLUMN trn_apps int after emb_apps, ALGORITHM=inplace, LOCK=none;
ALTER TABLE quaysidg_news.sales_data ADD COLUMN nn_apps int after trn_apps, ALGORITHM=inplace, LOCK=none;

desc quaysidg_news.sales_data;