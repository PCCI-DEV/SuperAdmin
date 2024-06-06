import { Button, Result } from 'antd';

import useLanguage from '@/locale/useLanguage';

const About = () => {
  const translate = useLanguage();
  return (
    <Result
      status="info"
      title={'TEKENA'}
      subTitle={translate('This is Expert Systems')}
      extra={
        <>
          <p>
            Website : <a href="https://www.pccintegrate.com">www.pccintegrate.com</a>{' '}
          </p>
          <p>
            GitHub :{' '}
            <a href="https://github.com/PCCI-DEV/SuperAdmin.git">
              https://github.com/PCCI-DEV/SuperAdmin.git
            </a>
          </p>
          <Button
            type="primary"
            onClick={() => {
              window.open(`https://wwwpccintegrate.com/contact-us/`);
            }}
          >
            {translate('Contact us')}
          </Button>
        </>
      }
    />
  );
};

export default About;
