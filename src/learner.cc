/**
 * Copyright (c) 2015 by Contributors
 */
#include "difacto/learner.h"
#include "./sgd/ffm_sgd_param.h"
#include "./sgd/ffm_sgd_learner.h"
#include "./sgd/fm_sgd_param.h"
#include "./sgd/fm_sgd_learner.h"
#include "./bcd/bcd_param.h"

namespace difacto {

DMLC_REGISTER_PARAMETER(FFMSGDLearnerParam);
DMLC_REGISTER_PARAMETER(FMSGDLearnerParam);
DMLC_REGISTER_PARAMETER(BCDLearnerParam);

Learner* Learner::Create(const std::string& type) {
  if (type == "ffmsgd") {
    return new FFMSGDLearner();
  } else if (type == "fmsgd") {
    return new FMSGDLearner();
  } else {
    LOG(FATAL) << "unknown learner type: " << type;
  }
  return nullptr;
}

KWArgs Learner::Init(const KWArgs& kwargs) {
  // init job tracker
  tracker_ = Tracker::Create();
  auto remain = tracker_->Init(kwargs);
  using namespace std::placeholders;
  tracker_->SetExecutor(std::bind(&Learner::Process, this, _1, _2));
  return remain;
}

}  // namespace difacto
