CREATE TABLE `subject` (
          `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'pk',
          `img` varchar(512) NOT NULL COMMENT '图片',
          `option` varchar(512) NOT NULL DEFAULT '' COMMENT '题目选项，为json格式',
          `answer_key` varchar(32) NOT NULL DEFAULT '' COMMENT '选择题的key，为ABCD等字符',
          `answer_value` varchar(32) NOT NULL DEFAULT '' COMMENT '答案value，电影名',
          `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
          `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
          `hash` char(32) NOT NULL DEFAULT '' COMMENT '哈希值',
          PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2046 DEFAULT CHARSET=utf8 COMMENT='题目表';

INSERT INTO `subject` (`id`, `img`, `option`, `answer_key`, `answer_value`, `create_time`, `status`, `hash`)
VALUES
	(1, '/img/cut/yaoshen.webp', '{ \"A\": \"无人区\", \"B\": \"人在囧途\", \"C\": \"我不是药神\", \"D\": \"心花路放\" }', 'C', '我不是药神', '2018-09-08 12:34:06', 0, '');

INSERT INTO `subject` (`id`, `img`, `option`, `answer_key`, `answer_value`, `create_time`, `status`, `hash`)
VALUES
	(2, '/img/cut/bat.webp', '{ \"A\": \"黑暗骑士崛起\", \"B\": \"蝙蝠侠大战超人\", \"C\": \"侠影之谜\", \"D\": \"黑暗骑士\" }', 'D', '黑暗骑士', '2018-09-08 12:34:19', 0, '');
