# Alfonso
resource "aws_iam_user" "alfonso" {
    provider = "aws.expotest"
    name = "alfonso.gutierrez"
    path = "/"

  tags = {
    tag-key = "alfonso.gutierrez"
  }
}

resource "aws_iam_user_group_membership" "alfonso" {
  provider = "aws.expotest"
  user = "${aws_iam_user.alfonso.name}"

  groups = [
    "${aws_iam_group.sts_access.name}"
  ]
}
############################

resource "aws_iam_user" "ahmed_gabran" {
    provider = "aws.expotest"
    name = "ahmed.gabran"
    path = "/"

  tags = {
    tag-key = "ahmed.gabran"
  }
}

resource "aws_iam_user_group_membership" "ahmed_gabran" {
  provider = "aws.expotest"
  user = "${aws_iam_user.ahmed_gabran.name}"

  groups = [
    "${aws_iam_group.sts_access.name}"
  ]
}

############################

resource "aws_iam_user" "saja_abu_gharbieh" {
    provider = "aws.expotest"
    name = "saja.abu"
    path = "/"

  tags = {
    tag-key = "saja.abu"
  }
}

resource "aws_iam_user_group_membership" "saja_abu_gharbieh" {
  provider = "aws.expotest"
  user = "${aws_iam_user.saja_abu_gharbieh.name}"

  groups = [
    "${aws_iam_group.sts_access.name}"
  ]
}

#########################################

resource "aws_iam_user" "jaydeep_prajapati" {
    provider = "aws.expotest"
    name = "jaydeep.prajapati"
    path = "/"

  tags = {
    tag-key = "jaydeep.prajapati"
  }
}

resource "aws_iam_user_group_membership" "jaydeep_prajapati" {
  provider = "aws.expotest"
  user = "${aws_iam_user.jaydeep_prajapati.name}"

  groups = [
    "${aws_iam_group.sts_access.name}"
  ]
}

################################################

# Khallad Albader

resource "aws_iam_user" "khallad_albader" {
    provider = "aws.expotest"
    name = "khallad.albader"
    path = "/"

  tags = {
    tag-key = "khallad.albader"
  }
}

resource "aws_iam_user_group_membership" "khallad_albader" {
  provider = "aws.expotest"
  user = "${aws_iam_user.khallad_albader.name}"

  groups = [
    "${aws_iam_group.sts_access.name}"
  ]
}

################################################

# Mukhamed Abu Osbah

resource "aws_iam_user" "mukhamed_abu" {
    provider = "aws.expotest"
    name = "mukhamed.abu"
    path = "/"

  tags = {
    tag-key = "mukhamed.abu"
  }
}

resource "aws_iam_user_group_membership" "mukhamed_abu" {
  provider = "aws.expotest"
  user = "${aws_iam_user.mukhamed_abu.name}"

  groups = [
    "${aws_iam_group.sts_access.name}"
  ]
}

################################################

# Venkatesan Selvaraj

resource "aws_iam_user" "venkatesan_selvaraj" {
    provider = "aws.expotest"
    name = "venkatesan.selvaraj"
    path = "/"

  tags = {
    tag-key = "venkatesan.selvaraj"
  }
}

resource "aws_iam_user_group_membership" "venkatesan_selvaraj" {
  provider = "aws.expotest"
  user = "${aws_iam_user.venkatesan_selvaraj.name}"

  groups = [
    "${aws_iam_group.sts_access.name}"
  ]
}
################################################

# # Venkatesan Selvaraj

# resource "aws_iam_user" "venkatesan_selvaraj" {
#     provider = "aws.expotest"
#     name = "venkatesan.selvaraj"
#     path = "/"

#   tags = {
#     tag-key = "venkatesan.selvaraj"
#   }
# }

# resource "aws_iam_user_group_membership" "venkatesan_selvaraj" {
#   provider = "aws.expotest"
#   user = "${aws_iam_user.venkatesan_selvaraj.name}"

#   groups = [
#     "${aws_iam_group.sts_access.name}"
#   ]
# }
